/* Program that displays 0 on DE1 board HEX display */
.text

.macro MOVIA reg, addr
  movhi \reg, %hi(\addr)
  ori \reg, \reg, %lo(\addr)
.endm

# define constants
.equ Hex0, 0x11010    #find the base address of Hex0 in the system.h file

.global main

main:
			movia   r2, Hex0
			movia		r8, NUMBERS		# r8 points to the address where HEx0 is stored
			ldw		r4, 0(r8)		    # r4 is a counter, initialize it with N

LOOP:
			stbio  r4, 0(r2)
			br			LOOP


NUMBERS:
		   .byte        0x40

		.end

