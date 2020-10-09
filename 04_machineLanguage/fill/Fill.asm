// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
	@KBD
	D=A
	@addr1 //R16 contains KBD origin address
	M=D
(LOOP)
	@SCREEN // R17 contains SCREEN origin address
	D=A
	@addr2
	M=D
	@KBD
	D=M
	@kbdvalue //R18
	M=D
	@0
	D=A
	@kbdvalue
	D=D-M
	@LOOPSCREENBLACKEN
	D;JNE
	@LOOPSCREENWHITEN
	D;JEQ
	@LOOP
	0;JMP
(LOOPSCREENBLACKEN)
	@addr2
	D=M
	@addr1
	D=D-M
	@BLACKEN
	D;JLT  // if SCREEN adress is < KBD addres
	@LOOP
	0;JMP
(BLACKEN)
	@addr2 // Set addr2 value = -1
	A=M
	M=-1
	@1  // Set D=1
	D=A
	@addr2
	M=D+M
	@LOOPSCREENBLACKEN
	0;JMP
(LOOPSCREENWHITEN)
	@addr2
	D=M
	@addr1
	D=D-M
	@WHITEN
	D;JLT  // if SCREEN adress is < KBD addres
	@LOOP
	0;JMP
(WHITEN)
	@addr2 // Set addr2 value = 0
	A=M
	M=0
	@1  // Set D=1
	D=A
	@addr2
	M=D+M
	@LOOPSCREENWHITEN
	0;JMP

