ece3710
=======

Plan B for the win!

Nexys 3
  * http://www.digilentinc.com/Products/Detail.cfm?Prod=NEXYS3

  * Useful reference for Nexys 3 SSD and LEDs
    * http://www-classes.usc.edu/engr/ee-s/201/Spring2012/ISE/test_nexys3_verilog/test_nexys3_verilog.v


Zapp Guns:
  * http://www.zero-soft.com/HW/USB_ZAPPER/
  * https://www.youtube.com/watch?v=c3tBk-LYyzo

  * Wires:
     * red is vcc
     * yellow ground
     * brown trigger
     * blue photo

Memory:
  * Copy load and store will be the same instruction twice
  * Load duplicate, store is a no-op


Assembly
 * load Rdest, Raddr # First arguement is the desination reg, the second arguement is the address to pull data from
 * stor Rsrc, Raddr  # Opposite convention from load.
 * Immediates can be written as:
  * Hex: 0xc0 or 0XC0 
  * Binary: 0b11110000 or 0B11110000 

  * Example:
    * lui 0b11000000, $4
    * lui 0xc0, $4

Registers Convention
 * 0-5 temp
 * 6-13 saved values
 * 14 argument
 * 15 return value

The duck can move based on CPU instructions. 
Sprite X address 16'b1100000000000000 or lui 192
Sprite Y address 16'b1100000000000001 or lui 192 and add 1

0xC0 = 192
