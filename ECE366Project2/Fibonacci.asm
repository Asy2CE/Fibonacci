        .data
NUM_IN:   .word   10       # Example input n=10
FIB_OUT:  .word   0        

        .text
        .globl main
main:
        lw    $t0, NUM_IN($zero)    # $t0 <- M[NUM_IN]
        beq   $t0, $zero, fib_n_is_n  # If n == 0 => fib(n)=0
        addi  $t1, $zero, 1           # $t1 = 1
        beq   $t0, $t1, fib_n_is_n    # If n == 1 => fib(n)=1
        or    $t1, $zero, $zero    # a = 0
        addi  $t2, $zero, 1        # b = 1
        addi  $t3, $zero, 1        # i = 1

fib_loop:
        sub   $t4, $t3, $t0        # $t4 = i - n
        bgez  $t4, fib_done        # if i - n >= 0 => done
        or    $t5, $t2, $zero      # $t5 = b
        add   $t2, $t1, $t2
        or    $t1, $t5, $zero
        addi  $t3, $t3, 1
        beq   $zero, $zero, fib_loop

fib_n_is_n:
        or    $t2, $t0, $zero   # put n into $t2
        beq   $zero, $zero, fib_done

fib_done:
        sw    $t2, FIB_OUT($zero)  

