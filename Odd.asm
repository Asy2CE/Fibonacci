.data
m:          .word 10           # Test input 10
is_odd:     .word 0           

.text
.globl main

main:
        la $t0, m
        lw $t1, 0($t0)            # $t1 = m

        li $t2, 2                 # divisor = 2
        move $a0, $t1             # $a0 = m
        move $a1, $t2             # $a1 = 2

        
        move $t6, $a0              # Copy m to $t6
        move $t7, $a1

    
div_loop:
        blt $t6, $t7, div_done     # If m < 2, division is done
        sub $t6, $t6, $t7          # Subtract 2 from m
        j div_loop                 

div_done:
        move $t8, $t6              

    # If remainder is 0, it's even, else it's odd
        li $t3, 1                  
        beq $t8, $zero, store_even 

store_odd:
        li $t4, 1                  # Set result to 1 (odd)
        j store_result

store_even:
        li $t4, 0                  # Set result to 0 (even)

store_result:
        la $t5, is_odd             
        sw $t4, 0($t5)             