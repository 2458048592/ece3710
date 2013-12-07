lui 0xc0, $0 # load 0xc0 into upper 8 bits of r0.  0xc0000 is the x Location for sprite1
movi 0, $2  # inital x,y location.  Use r1 for both x and y location for sprite1
moveLoop: xor $0, $0
lui 0xc0, $0 # load 0xc0 into upper 8 bits of r0.  this will overwrite the bottom 8 bits to 0
stor $2, $0 # continually store the value in $1 to the X location for sprite1
addui 1, $0 # address 0xc001 is the Y location for sprite1
stor $2, $0 # continually store the value in $1 to the Y location for sprite1
movi duckIncrement, $15 # set up r15 to increment the duck if we have counted through 25 iterations of moveLoop
cmpui 25, $1
beq $15
movi moveLoop, $15 # ELSE, we need to jump back to moveLoop and count
addui 1, $1
juc $15
duckIncrement: xor $0, $0
addui 1, $2 # increment duck x and duck y locations
xor $1, $1 #clear out the moveLoop counter
movi displayBlack, $15
juc $15
displayBlack: movi 0x3f, $3 # r3 will hold a comparison value for the displayBlack value.  Whenever the bottom 6-bits of the duck counter equals 0x30, then NOT displayBlack
and $2, $3
movi notBlack, $15
cmpui 0x30, $3
beq $15
movi spriteOff, $15
xor $3, $3
juc $15
notBlack: not $4, $4 # NOT displayBlack # r4 will hold displayBlack value
lui 0xc0, $0
addui 0x02, $0
stor $4, $0
movi spriteOff, $15
xor $3, $3
juc $15
spriteOff: movi 0x0f, $3 # r3 will hold a comparison value for the sprite1On value.  Whenever the bottom 4-bits of the duck counter equals 0x0f, then NOT sprite1On
and $2, $3
movi notSprite, $15
cmpui 0x0f, $3
beq $15
movi spriteWhite, $15
xor $3, $3
juc $15
notSprite: lui 0xc0, $0
addui 4, $0 # 0xc004 is the address for sprite1On
stor $4, $0 # use the displayBlack boolean to turn the duck on and off.  This should happen irregularly
movi spriteWhite, $15
xor $3, $3
juc $15
spriteWhite: movi 0x1f, $3 # r3 will hold a comparison value for the sprite1White value.  Whenever the bottom 4-bits of the duck counter equals 0x10, then NOT sprite1White
and $2, $3
movi notWhite, $15
cmpui 0x10, $3
beq $15
movi displayColor, $15
xor $3, $3
juc $15
notWhite: lui 0xc0, $0
addui 5, $0 # 0xc005 is the address for sprite1White
stor $4, $0 # use the displayBlack boolean to turn the duck on and off.  This should happen irregularly
movi displayColor, $15
xor $3, $3
juc $15
displayColor: movi 0xff, $3 # r3 will hold a comparison value for the displayColor value.  Whenever the bottom 10-bits of the duck counter equals 0xff, then increment the displayColor
mov $3, $14 # set r14 to be 255
and $2, $3
movi modDisplayColor, $15
cmp $14, $3 # compare the duck position to 255.  If duck position is 255, then change the background color
beq $15
movi moveLoop, $15
xor $3, $3
juc $15
modDisplayColor: lui 0xc0, $0
addui 3, $0 # 0xc003 is the address for displayColor
addui 1, $5 # increment the display color
stor $5, $0 # store the display color in VMEM
mov $5, $6  # move display color to r6
not $6, $6  # invert display color to get text color
addui 3, $0 # 0xc006 is the address for textColor
stor $6, $0
movi moveLoop, $15
xor $3, $3
juc $15