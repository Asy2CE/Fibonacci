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
    jal division              

    # if m % 2 == 0 → even → store 0
    # else → odd → store 1
    li $t3, 1
    beq $v0, $zero, store_even
    j store_odd

store_even:
    li $t4, 0
    j store_result

store_odd:
    li $t4, 1

store_result:
    la $t5, is_odd
    sw $t4, 0($t5)



division:
    move $t6, $a0    
    move $t7, $a1    
    
div_loop:
    blt $t6, $t7, div_done
    sub $t6, $t6, $t7
    j div_loop

div_done:
    move $v0, $t6     
    jr $ra