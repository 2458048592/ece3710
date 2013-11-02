file = ARGV.shift
IO.read( file ).split( "\n" ).each do |line|
  line =~ /^(\d{16}).*#(\d{16})$/
  raise "Invalid: #{line} \n#{$1}\n#{$2}" unless $1 == $2
end
puts "Tests passed"

