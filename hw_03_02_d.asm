.data
prompt_x:   .asciiz "Enter the value of 'x': "
prompt_y:   .asciiz "Enter the value of 'y': "
result_msg: .asciiz "The result of '((4x/3) * y)' is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4 
    la $a0, prompt_y 
    syscall

    li $v0, 5 
    syscall
    move $t1, $v0

    # Calculation for '4x'
    sll $t2, $t0, 2

    # Calculation for "(4x / 3)"
    li $t3, 3
    div $t2, $t3
    mflo $t2

    # Calculation for "((4x/3) * y)"
    mul $t4, $t2, $t1

    li $v0, 4           
    la $a0, result_msg   
    syscall             

    li $v0, 1           
    move $a0, $t4        
    syscall

    li $v0, 10
    syscall
