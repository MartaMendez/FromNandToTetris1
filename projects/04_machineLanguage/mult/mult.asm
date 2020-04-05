// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
	@R0 // define R0 (number to be added R1 times) 
	D=M
	@R2 // Set R2=0
	M=0  //M=D
	@R1 // define R1 (number of times that R0 must be added)
	D=M
	@n // Set n=R17   
	M=D
	@i // Set i=R18 (counter) 
	M=0
(LOOP)
	@i
	D=M
	@n
	D=D-M
	@END
	D;JGE // if i>=n goto STOP
	@R0
	D=M
	@R2
	D=D+M
	@R2
	M=D
	@i
	M=M+1  // i=i+1
	@LOOP
	0;JMP
(END)
	@END// End program
	0;JMP
