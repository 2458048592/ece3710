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
 * Labels
   * Labels must start with a letter (A-Z or a-z) 
   * Label must end with a colon ( : ) 
   * Labels are treated as immediates in assembly
     * Example:
        * movi MyLabel, $1 
        * cmpi AnotherLabel, $1
   * All labels must be loaded with LBN (see pseudo instruction)
 * Variables
   * A label reserves a variable's position in memory with a NOP
   * All variables will start with VAR_
   * Example:
     * VAR_myVar: xor $0, $0

 * Registers Convention
   * 0-6 temp (0 used for nop's)
   * 7-11 saved values
   * 12-14 argument
   * 15 return value
 * Random numbers
   * LBN $0, $1, 0x2008  # 8bit random number   
   * LBN $0, $1, 0x2009  # 9bit random number   
   * LBN $0, $1, 0x2010  # 10bit random number 
 * Guns 
   * LBN $0, $3, 0x2000 # player 1 trigger
   * LBN $0, $3, 0x2001 # player 1 sensor
   * LBN $0, $3, 0x2002 # player 2 trigger
   * LBN $0, $3, 0x2003 # palyer 2 sensor

 * Pseudo Instructions
   * LBN - Loads a 16-bit number into a register
     * LBN $Rsrc, $Rdest, <immediate value>

     * Example:
        * LBN $3, $1, 0x1234
        * LBN $3, $1, my_label

     * The assembler compiles it to 3 instructions
       * LBN $3, $1, 0x1234
           * LUI 0x12, $1
           * MOVI 0x34, $3
           * OR $3, $1
     * All labels must be loaded with LBN
   
   * NUM - initializes an immediate into memory (Useful for writing glyphs)

      * hex:             NUM 0x123
      * letters_PLA: NUM 0b011010_010110_001011
      * decimal:       NUM 1234

      * This is how you can load a letter:
        * P: NUM 0b011010
        * LBN $1, $13,  P
        * load $13, $13 
 
VGA
 * The duck can move based on CPU instructions. 
   * Sprite X address 16'b1100000000000000 or lui 192
   * Sprite Y address 16'b1100000000000001 or lui 192 and add 1
 * Some conversions
  * 192 = 0xC0 
  * 480 = 0x1e0
  * 240 = 0xf0
  * 640 = 0x280
  * 320 = 0x140

!!!!!!!New Stuff!!!!!!!
There is a new instruction: GSTOR = 4'b1100
This is a VMEM type instruction which has 3 registers as its arguments, RTop, RBottom, and RAddr
Usage is like this
GSTOR $RTop, $RBottom, $RAddr

RTop needs to appear out of the readRegA mux
RBottom needs to appear out of the readRegB mux
RAddr needs to appear out of the memAddr mux

This instruction allows us to write 3 glyphs at a time to the glyphMap, overcoming a previous limitation (direct addressing).  By adding this new instruction, we can modify each individual glyph in the glyph map.

This also fixes a problem where storing to VMEM was occurring when it shouldn't have (One of my previous changes was lost) in the glyph map.

Also new:
The following addresses allow us to modify the VGA/Sprite via a simple STOR instruction (don't try to LOAD, you won't get anything).
0xc000: Sprite1 X Location (10-bit)
0xc001: Sprite1 Y Location (10-bit)
0xc002: display Black (1-bit)
0xc003: display Color (8-bit)
0xc004: sprite1 On (1-bit)
0xc005: sprite1 White (1-bit)
0xc006: textColor (8-bit)

X and Y have not changed from the previous revision.  This adds the display Black, display Color, sprite1 On, sprite1 White, and text Color support.

By setting displayBlack to 1'b1, the entire game display will be set black (this only affects Normal mode, not Debug Mode). Default == 1'b0;
By setting displayColor to some 8-bit value, the background color will be set to that value. Default == 8'b00000000
By setting sprite1On to 1'b0, sprite1 (the duck) will not be displayed on the background.  This is not affected by displayBlack.  Default == 1'b1;
By setting sprite1White to 1'b1, sprite1 (the duck) will be changed to a white box 64 pixels by 64 pixels.  Default == 1'b0.
By setting textColor to some 8-bit value, the text color will be set to that value.  Default == 8'b11111111
