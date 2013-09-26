#!/usr/bin/ruby -w

file = ARGV.shift

raise "Pass file name as first argument" unless file

instr_types = {
  :addi => :immed,
  :beq => :branch, 
  :add => :reg,
  :sub => :reg,
  :j => :jump,
  :sb => :memory,
  :lb => :memory,
}

instr_bits = {
  :addi => 0b001000,
  :beq =>  0b000100,
  :add =>  0b000000,
  :sub =>  0b000000,
  :j =>    0b000010,
  :sb =>   0b101000,
  :lb =>   0b100000,
}

alu_instr = {
  :add => 0b100000,
  :sub => 0b100010,
}

def get_reg( reg, pos )
  raise "This doesn't look like a register: #{reg}" unless reg =~ /^\$(\d+)$/
  num = $1.to_i
  num << ( 31 - 5 * ( pos + 1 ) )
end

parsed = []
labels = {}

counter = 0
IO.read( file ).split( "\n" ).each do |line|
  next if line =~ /^\s*$/
  next if line =~ /^\s*#/
  raise "Invalid line: #{line}" unless line =~ /^\s*((\w+):)?\s*(\w+)\s(.*?)\s*(#.*|$)/
  label = $2
  inst = $3.to_sym
  args = $4.split( /,\s+/ )

  parsed.push( {
    :inst => inst,
    :args => args,
    :line => line,
    :addr => counter
  } )
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
  result = instr_bit << ( 32 - 6 )
  case type
  when :immed
    result += get_reg( args[0], 2 )
    result += get_reg( args[1], 1 )
    result += args[2].to_i & 0xffff
  when :branch
    result += get_reg( args[0], 1 )
    result += get_reg( args[1], 2 )
    addr = labels[args[2]]
    raise "No such label: #{args[2].inspect}" unless addr
    result += (addr - my_addr - 1) & 0xffff
  when :reg
    result += get_reg( args[0], 3 )
    result += get_reg( args[1], 1 )
    result += get_reg( args[2], 2 )
    alu = alu_instr[ inst ]
    raise "No alu instr for #{inst}" unless alu
    result += alu
  when :jump
    addr = labels[args[0]]
    raise "No such label: #{args[0].inspect}" unless addr
    result += addr
  when :memory
    result += get_reg( args[0], 2 )
    raise "Invalid memory address #{args[1]}" unless args[1] =~ /^(\d+)\((.*?)\)$/
    result += get_reg( $2, 1 )
    result += $1.to_i & 0xffff
  else
    raise "Unsupported instruction #{inst}"
  end
  printf "%08x %s\n", result, data[:line]
end
