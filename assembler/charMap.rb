#!/usr/bin/ruby -w

counter = 0
for i in 1620 .. 3239
  printf "%04x \n", i
  counter += 1
end

