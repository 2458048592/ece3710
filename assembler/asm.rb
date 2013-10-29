#!/usr/bin/ruby -w

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
  :LSH =>   :shift,
  :LSHI =>  :i_shift,         # Imm is unsigned
  :RSH =>   :shift,         
  :RSHI =>  :i_shift,          # Imm is unsigned
  :ALSH =>  :shift,           # Interprets RSrc as Unsigned
  :ARSH =>  :shift,           # Interprets RSrc as Unsigned
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
  :LSH => 0b100001000,
  :LSHI => 0b10000000, # Imm is unsigned
  :RSH => 0b10001100,
  :RSHI => 0b10000001, # Imm is unsigned
  :ALSH => 0b10000101, # Interprets RSrc as Unsigned
  :ARSH => 0b10001101, # Interprets RSrc as Unsigned
}

alu_instr = {
  :add => 0b100000,
  :sub => 0b100010,
}

# position 0 is Rsrc, position 1 is Rdest
def get_reg( reg, pos )
  raise "This doesn't look like a register: #{reg}" unless reg =~ /^\$(\d+)$/ 
  num = $1.to_i # num is register number
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

parsed.each do |data|
  inst = data[:inst]
  args = data[:args]
  my_addr = data[:addr]

  type = instr_types[ inst ]
  instr_bit = instr_bits[ inst ]
  raise "No bits for #{inst}" unless instr_bit
  case type
  when :r_type
		result = (instr_bit & 0xf0) << ( 4 ) # append the top 4 bits of the op-code to bit 15-12
    result += get_reg( args[0], 0) # append Rsrc
    result += get_reg( args[1], 1) # append Rdest
    result += (instr_bit & 0x0f) << (4) # append op-code ext
	when :i_type
		result = (instr_bit & 0xf0) << ( 8 ) 
	  result += (args[0].to_i & 0xff) # append 8 bit immediate value 
    result += get_reg( args[1], 1) # append Rdest	
  else
    raise "Unsupported instruction #{inst}"
  end
  printf "%016B %s\n", result, data[:line]
end
