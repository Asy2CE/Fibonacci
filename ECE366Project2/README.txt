## ECE 366 Project 2: Progress report 1

## Members:
	1) Mahmoud Asy: 667631843
	-Contribution: Prepared the README, verified instructions, and set up Github repository. Also helped with writing the Fibonnacy assembly.
	2) Yagnya Tiruttani 673141067
	-Contribution: Wrote the initial Fibonacci MIPS assembly code and tested in MARS.
		
Github Repository: https://github.com/Asy2CE/Fibonacci.git

## How to Run Our MIPS Program

1. Open `fibonacci.asm` in MIPS 
2. Assemble the program.
3. Load the data segment so that `NUM_IN` is placed in memory.
4. Run the program:
   - The code reads the integer `n` from `NUM_IN`.
   - It writes the computed Fibonacci number to `FIB_OUT`.
5. Check Memory at `FIB_OUT` address. That location holds `fib(n)` after the program finishes.

##  To change the input `n`, simply edit `.word 10` under `NUM_IN` in the data section. 
##  The final result is stored in `FIB_OUT`.
