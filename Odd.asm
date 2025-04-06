.data
NUM_IN:    .word  10      # example input n = 10
ODD_OUT:   .word  0

        .text
        .globl main
main:
        lw   $a0, NUM_IN      #Load m
        jal  Odd              #call Odd(m)
        sw   $v0, ODD_OUT     #result (0 or 1)
        li   $v0, 10
        syscall


Odd:
        li   $t0, 2           # $t0 = 2 (divisor)
        move $t1, $a0         # $t1 = m (numerator)
        li   $t2, 0           
        
div_loop:
        blt  $t1, $t0, div_done  
        sub  $t1, $t1, $t0     
        addi $t2, $t2, 1         
        j    div_loop

div_done:
        move $v0, $t1         
        jr   $ra