/* Program that displays 0 on DE1 board HEX display
and increments if the switch SW1 is pressed or decrements,
if the switch SW1 is released. Hex0 can go beyond 0 and above 9.
*/
.text

.macro MOVIA reg, addr
  movhi \reg, %hi(\addr)
  ori \reg, \reg, %lo(\addr)
.endm

# define constants
.equ Hex0, 0x11010    #base address of Hex0 in the system.h
.equ Keys, 0x11000    #base address of Keys (pushbuttons) in the system.h
.equ SW,   0x11020

.global main

main:
			movia   r2, Hex0 # pointer to the first element of Hex0  array
			movia   r3, Keys # pointer to the first element of Keys array
			movia   r7, SW   # swi pointer to the first element of SW array
			movia   r10, NUMBERS    #pointer to the first element of the NUMBERS array
			movia   r13, NUMBERS
			addi    r11, r10, 9     #pointer to the last element of the NUMBERS array

PRESSED:			
			ldbio  r6, 0(r3) #dereferrence the pointer to Keys
			andi   r5, r6, 0X02 #use bitmasking to check the second bit of keys
			beq    r0, r5, RELEASED
			bne    r0, r5, PRESSED

RELEASED:
			ldbio  r6, 0(r3) #dereferrence the pointer to Keys
			andi   r5, r6, 0X02 #use bitmasking to check the second bit of keys
			beq    r0, r5, RELEASED
			bne    r0, r5, SW_CHECK

SW_CHECK:
			ldbio  r8, 0(r7)
			andi   r9, r8, 0x01 # use bitmasking to check if the first bit of switches
			beq    r0, r9, DECR # if switch != 0 then go to decrement
			bne    r0, r9, INCR # if switch  = 1 then go to increment

INCR: 
			beq r13, r11, BACK_TO_0 # check if the index pointter hits the lower and upper limits of the array (PRESSED originally)
			addi r13, r13, 1 # jumping to the next address. Each address is 1 byte.
			br DISPLAY

DECR: 
			beq r13, r10, BACK_TO_9 # check if the index pointter hits the lower and upper limits of the array (PRESSED originally)
			subi r13, r13, 1 # jumping to the previous address. Each address is 1 byte.
			br DISPLAY

BACK_TO_0:
			add r13, r10, r0# store value 0 in the address of r13
			br DISPLAY

BACK_TO_9:
			add r13, r11, r0# store value 9 in the address of r13
			br DISPLAY

DISPLAY:
			ldbio		r12, 0(r13)	# loads data (byte) from r4 to r8 with 0 offset
			stbio       r12, 0(r2)  # store digit to display on Hex0 in the register r2
			br			PRESSED

NUMBERS:
		   .byte        0x40 #0
		   .byte        0x79 #1
		   .byte        0x24 #2
		   .byte        0x30 #3
		   .byte        0x19 #4
		   .byte        0x12 #5
		   .byte        0x2  #6
		   .byte        0x78 #7
		   .byte        0x0  #8
		   .byte        0x10 #9
		.end

