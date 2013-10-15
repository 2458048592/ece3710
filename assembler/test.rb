def interp(line)
  raise "Invalid line: #{line}" unless line =~ /^\s*((\w+):)?\s*(\w+)\s(.*?)\s*(#.*|$)/
  label = $2
  inst = $3.upcase.to_sym
  args = $4.split( /,\s+/ )
  puts "  label: #{label}\n  inst: #{inst}\n  args: #{args.join(", ")}\n"
end

puts "r-type"
line = "fibn:  add $3, $0   # initialize n = 8 "
interp(line)

puts "i-type"
line = "iiii:  addi 12, $0   # initialize n = 8 "
interp(line)

