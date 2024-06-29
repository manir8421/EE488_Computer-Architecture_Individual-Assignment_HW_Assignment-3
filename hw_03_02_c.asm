.data
prompt_x: .asciiz "Enter the value of 'x': "
result_msg: .asciiz "The result of '(x^3 + 2x^2 + 3x + 4)' is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Calculation for 'x^3'
    mul $t1, $t0, $t0  
    mul $t1, $t1, $t0

    # Calculation for '2x^2'
    mul $t2, $t0, $t0  
    add $t2, $t2, $t2 

    # Calculation for '3x'
    add $t3, $t0, $t0 
    add $t3, $t3, $t0

    # Calculation for '(x^3 + 2x^2 + 3x + 4)'
    add $t4, $t1, $t2
    add $t4, $t4, $t3
    addi $t4, $t4, 4

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
