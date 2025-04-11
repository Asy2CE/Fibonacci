        .data
NUM_IN:     .word 10             # Example input n=10
IS_ODD:     .word 0             

        .text
        .globl main

main:
        lw    $t0, NUM_IN($zero)     # $t0 = M[NUM_IN]
        beq   $t0, $zero, fib_n_is_n # If n == 0 => fib(n)=0
        addi  $t1, $zero, 1          # $t1 = 1
        beq   $t0, $t1, fib_n_is_n   # If n == 1 => fib(n)=1

        or    $t1, $zero, $zero      # a = 0
        addi  $t2, $zero, 1          # b = 1
        addi  $t3, $zero, 1          # i = 1

fib_loop:
        sub   $t4, $t3, $t0          # $t4 = i - n
        bgez  $t4, fib_done          # if i - n >= 0 => done
        or    $t5, $t2, $zero        # $t5 = b
        add   $t2, $t1, $t2
        or    $t1, $t5, $zero
        addi  $t3, $t3, 1
        beq   $zero, $zero, fib_loop

fib_n_is_n:
        or    $t2, $t0, $zero        # put n into $t2
        beq   $zero, $zero, fib_done

fib_done:
        li    $t6, 2                 # divisor = 2
        move  $t7, $t2               # $t7 = fib(n)

div_loop:
        blt   $t7, $t6, div_done2    # If m < 2, division is done
        sub   $t7, $t7, $t6          # Subtract 2 from m 
        beq   $zero, $zero, div_loop

div_done2:
        move $t8, $t6              

    # If remainder is 0, it's even, else it's odd
        li $t3, 1                  
        beq $t8, $zero, store_even 

store_odd:
        li    $t4, 1                 # Set result to 1 (odd)
        j     store_result

store_even:
        li    $t4, 0                 # Set result to 0 (even)

store_result:
        la    $t5, IS_ODD           
        sw    $t4, 0($t5)

end:
        beq   $zero, $zero, end
