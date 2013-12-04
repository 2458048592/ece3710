require 'rubygems'
require 'RMagick'

pixels = []
image = Magick::Image.read("duck64.png")[0]
image.format = 'bgra'
#blob = image.to_blob
new_pixel = red = green = blue = alpha = 0

count = 0
image.each_pixel do |pixel, c, r|
  #red=65535, green=65535, blue=65535, opacity=65021

  pixels.push(pixel)

  pixel = pixel.to_s
  pixel =~ /^\bred\b=(\d+).\s+\bgreen\b=(\d+).\s+\bblue\b=(\d+).\s+\bopacity\b=(\d+)$/
  red   = 0b01000 if $1.to_i > 20000
  green = 0b00100 if $2.to_i > 20000
  blue  = 0b00010 if $3.to_i > 20000
  alpha = 0b00001 if $4.to_i > 0
  #print "r:#{red} g:#{green} b:#{blue} o:#{alpha}\n"
  new_pixel += red
  new_pixel += green
  new_pixel += blue
  new_pixel += alpha
  #print "#{pixel}\n"
  printf "0" if count % 4 == 0 
  printf "%01x", new_pixel
  printf "\n" if count % 4 == 3 
  count += 1
  new_pixel = red = green = blue = alpha = 0
    
  #print "r:#{red} g:#{green} b:#{blue} o:#{alpha}\n"
  
end


image.destroy!
