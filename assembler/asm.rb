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

file = ARGV.shift

raise "Pass file name as first argument" unless file

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
  :BNEQ =>  :branch
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
}


# position 0 is Rsrc, position 1 is Rdest
def get_reg( reg, pos )
  raise "This doesn't look like a register: \'#{reg}\'" unless reg =~ /^\$[a-z]?(\d{1,2})_?.*?$/ 
  num = $1.to_i # num is register number
  #print "reg: #{reg}, pos #{pos} num: #{num} $1: #{$1}\n"
  num << ( pos * 8 ) 
end

parsed = []
labels = {}

# read in the file
counter = 0
IO.read( file ).split( "\n" ).each do |line|
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
    :addr => counter
  } )
  # labels is a hash
  labels[label] = counter if label
  counter += 1
end

line_count = 0

parsed.each do |data|
  inst = data[:inst]
  args = data[:args]
  my_addr = data[:addr]

  type = instr_types[ inst ]
  instr_bit = instr_bits[ inst ]
  raise "No bits for #{inst}" unless instr_bit
  case type
  when :r_type
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[0], 0) # append Rsrc
    result += get_reg( args[1], 1) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
<<<<<<< HEAD
	when :i_type
    #puts " args[0] = #{args[0]}"
		result = (instr_bit & 0xf0) << ( 8 ) 

    if (labels.has_key?(args[0]))
        print "Label: #{args[0]} = #{labels[args[0]]}\n" if $verbose
        args[0] = labels[args[0]]
    end
	  result += (args[0].to_i & 0xff) # append 8 bit immediate value 
=======
  when :i_type
    result = (instr_bit & 0xf0) << ( 8 ) 
    result += (args[0].to_i & 0xff) # append 8 bit immediate value 
>>>>>>> d3d398eb85d1182cb38e570045390a95f63bf6a7
    result += get_reg( args[1], 1) # append Rdest	
  when:i_shift
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += (0xf & args[0].to_i) # append Rammount
    result += get_reg( args[1], 1) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
  when :mem
    result = (instr_bit & 0xf0) << ( 8 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[1], 0) # append Rsrc
    result += get_reg( args[0], 1) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
  when :branch
    result = 0x4 << ( 12 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[0], 1)
    result += instr_bit
  else
    raise "Unsupported instruction #{inst}"
  end
   
  if ($verbose and $binary)
    printf "%018b %s\n", result, data[:line]
  elsif ($verbose and $test)
    printf "%016b %s\n", result, data[:line]
  elsif ($verbose)
    printf "%d(%x): %05x %s\n",line_count,line_count, result, data[:line]
    line_count += 1
  elsif ($binary)
    printf "%018b\n", result
  else
    printf "%05x\n", result
  end
end
