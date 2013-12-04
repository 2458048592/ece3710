require 'rubygems'
require 'RMagick'

pixels = []
image = Magick::Image.read("duck64.png")[0]
image.format = 'bgra'
#blob = image.to_blob

image.each_pixel do |pixel, c, r|
  #red=65535, green=65535, blue=65535, opacity=65021

  pixels.push(pixel)
  print "#{pixel}\n"

  pixel = pixel.to_s
  pixel =~ /^\bred\b=(\d+).\s+\bgreen\b=(\d+).\s+\bblue\b=(\d+).\s+\bopacity\b=(\d+)$/
  red = $1
  green = $2
  blue = $3
  alpha = $4
    
  print "r:#{red} g:#{green} b:#{blue} o:#{alpha}\n"
  
end


image.destroy!
