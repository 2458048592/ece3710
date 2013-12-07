#!/usr/bin/ruby -w

require 'optparse'

$verbose = false
$binary = false
$test = false
OptionParser.new do |opt|
  opt.on('-v','--verbose') { |b| $verbose = b }
  opt.on('-b','--binary') { |b| $binary = b }
  opt.on('-t','--binary') { |b| $test = b }
  opt.on('-h','--help') { puts opt; exit }
  opt.parse!
end

$file = ARGV.shift

raise "Pass file name as first argument" unless $file

instr_types = {
  :ADD =>   :r_type,
  :ADDI =>  :i_type, 
  :ADDU =>  :r_type,           
  :ADDUI => :i_type,            
  :ADDC =>  :r_type,
  :ADDCU => :r_type,            
  :ADDCUI =>:i_type,            # Replaces SUBCI
  :ADDCI => :i_type,            
  :SUB =>   :r_type,
  :SUBI =>  :i_type,
  :CMP =>   :r_type,
  :CMPI =>  :i_type,
  :CMPUI => :i_type,             # Replaces MULI
  :AND =>   :r_type,
  :OR =>    :r_type,
  :XOR =>   :r_type,
  :NOT =>   :r_type,
  :LSH =>   :r_type,
  :LSHI =>  :i_shift,         # Imm is unsigned
  :RSH =>   :r_type,         
  :RSHI =>  :i_shift,          # Imm is unsigned
  :ALSH =>  :r_type,           # Interprets RSrc as Unsigned
  :ARSH =>  :r_type,           # Interprets RSrc as Unsigned
  :LUI  =>  :i_type,
  :LOAD =>  :mem,
  :STOR =>  :mem,
  :MOV  =>  :r_type,
  :MOVI =>  :i_type,
  :JUC  =>  :branch,
  :BEQ  =>  :branch,
  :BNEQ =>  :branch,
  :BGT  =>  :branch,
  :BLT  =>  :branch,
  :BGE  =>  :branch,
  :BLE  =>  :branch,
  :NUM  =>  :number,
  :LBN =>   :big_num,
}

instr_bits = {
  :ADD => 0b00000101,
  :ADDI => 0b01010000,
  :ADDU => 0b00000110,
  :ADDUI => 0b01100000,
  :ADDC => 0b00000111,
  :ADDCU => 0b00000100,
  :ADDCUI => 0b10100000, # Replaces SUBCI
  :ADDCI => 0b01110000,
  :SUB => 0b00001001,
  :SUBI => 0b10010000,
  :CMP => 0b00001011,
  :CMPI => 0b10110000,
  :CMPUI => 0b11100000, # Replaces MULI
  :AND => 0b00000001,
  :OR => 0b00000010,
  :XOR => 0b00000011,
  :NOT => 0b00001111,
  :LSH => 0b10000100,
  :LSHI => 0b10000000, # Imm is unsigned
  :RSH => 0b10001100,
  :RSHI => 0b10000001, # Imm is unsigned
  :ALSH => 0b10000101, # Interprets RSrc as Unsigned
  :ARSH => 0b10001101, # Interprets RSrc as Unsigned
  :LUI  => 0b11110000,
  :LOAD => 0b01000000,
  :STOR => 0b01000100,
  :MOV  => 0b00001101,
  :MOVI => 0b11010000,
  :JUC  => 0b11001110,
  :BEQ  => 0b11000000,
  :BNEQ => 0b11000001,
  :BGT  => 0b11000110,
  :BLT  => 0b11000111,
  :BGE  => 0b11001101,
  :BLE  => 0b11001100,
  :NUM  => 0b0,
  :LBN  => 0b00000010,
}


# position 0 is Rsrc, position 1 is Rdest
def get_reg( reg, pos, line )
  raise "This doesn't look like a register: \'#{reg}\'\n**#{line} in #{$file}\n" unless reg =~ /^\$[a-z]?(\d{1,2})_?.*?$/ 
  num = $1.to_i # num is register number
  #print "reg: #{reg}, pos #{pos} num: #{num} $1: #{$1}\n"
  num << ( pos * 8 ) 
end

def get_imm(imm, labels)
  if (labels.has_key?(imm))
      print "Label: #{imm} = #{labels[imm]}\n" if $verbose
      imm = labels[imm]
  elsif (imm =~ /^[a-zA-Z]+/)
    raise "This is not a declared label #{imm} on line #{debug_line}"
  end

  if (imm =~ /^0[xX]/)
    imm = imm.to_i(16)
    #print "hex parameter = #{imm}\n"
  elsif (imm =~ /^0[bB]/)
    imm = imm.to_i(2)
    #print "binary = #{imm}\n"
  end
  return imm
end


parsed = []
labels = {}

# read in the file
counter = 0
debug_line_count = 0
IO.read( $file ).split( "\n" ).each do |line|
  debug_line_count += 1
  next if line =~ /^\s*$/
  next if line =~ /^\s*#/
  raise "Invalid line: #{line}" unless line =~ /^\s*((\w+):)?\s*(\w+)\s(.*?)\s*(#.*|$)/
  label = $2
  inst = $3.upcase.to_sym
  args = $4.split( /,\s+/ )

  parsed.push( {
    :inst => inst,
    :args => args,
    :line => line,
    :addr => counter,
    :debug => debug_line_count
  } )
  # labels is a hash
  labels[label] = counter if label
  if (inst =~ /^LBN$/) 
    counter += 3
  else
    counter += 1
  end
end

def print_result(result, line_count, debug_line, data)
  if ($verbose and $binary)
    printf "%018b %s\n", result, data[:line]
  elsif ($verbose and $test)
    printf "%016b %s\n", result, data[:line]
  elsif ($verbose)
    printf "[%-3x = %-3d] %05x       %-3d %s\n", line_count,line_count, result, debug_line, data[:line]
    line_count += 1
  elsif ($binary)
    printf "%018b\n", result
  else
    printf "%05x\n", result
  end
  return line_count
end


line_count = 0

parsed.each do |data|
  inst = data[:inst]
  args = data[:args]
  debug_line = data[:debug]
  error_message = "Error with \'#{inst} #{args[0]}, #{args[1]}\' on line #{debug_line}"

  type = instr_types[ inst ]
  instr_bit = instr_bits[ inst ]
  raise "No bits for #{inst}" unless instr_bit
  case type
  when :big_num
    imm = get_imm(args[2], labels)
    #print imm
    # LUI
		result = (instr_bits["LUI".to_sym] & 0xf0) << ( 8 ) 
	  result += ((imm.to_i & 0xff00) >> 8) # append 8 bit immediate value 
    result += get_reg( args[1], 1, error_message) # append Rdest	

    line_count = print_result(result, line_count, debug_line, data)
    #MOVI
		result = (instr_bits["MOVI".to_sym] & 0xf0) << ( 8 ) 
	  result += (imm.to_i & 0x00ff) # append 8 bit immediate value 
    result += get_reg( args[0], 1, error_message) # append Rdest	

    line_count = print_result(result, line_count, debug_line, data)

    # OR
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[0], 0, error_message) # append Rsrc
    result += get_reg( args[1], 1, error_message) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
  when :number
    result = get_imm(args[0], labels)
  when :r_type
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[0], 0, error_message) # append Rsrc
    result += get_reg( args[1], 1, error_message) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
  when :i_type
    #puts " args[0] = #{args[0]}"
		result = (instr_bit & 0xf0) << ( 8 ) 
    imm = get_imm(args[0], labels)


	  result += (imm.to_i & 0xff) # append 8 bit immediate value 
    result += get_reg( args[1], 1, error_message) # append Rdest	
  when:i_shift
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += (0xf & args[0].to_i) # append Rammount
    result += get_reg( args[1], 1, error_message) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
  when :mem
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[1], 0, error_message) # append Rsrc
    result += get_reg( args[0], 1, error_message) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
  when :branch
    result = 0x4 << ( 12 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[0], 1, error_message)
    result += instr_bit
  else
    raise "Unsupported instruction #{inst}"
  end

  line_count = print_result(result, line_count, debug_line, data)
   
end

