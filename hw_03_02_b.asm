.data
prompt_x: .asciiz "Enter the value of 'x': "
prompt_y: .asciiz "Enter the value of 'y': "
prompt_z: .asciiz "Enter the value of 'z': "
result_msg: .asciiz "The result of '((5x + 3y + z) / 2) * 3' is: "

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

    li $v0, 4
    la $a0, prompt_z
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    # Calculation part 01
    li $t3, 5
    mul $t3, $t3, $t0  

    li $t4, 3
    mul $t4, $t4, $t1 

    add $t5, $t3, $t4  
    add $t5, $t5, $t2  

    # Calculation part 02
    sra $t5, $t5, 1

    # Calculation part 03
    li $t6, 3
    mul $t5, $t5, $t6

    #result
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall
