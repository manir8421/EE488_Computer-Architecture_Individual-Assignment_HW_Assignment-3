.data
prompt_num1: .asciiz "Enter the first number: "
prompt_num2: .asciiz "Enter the second number: "
result_msg:  .asciiz "\n'After swapping, the numbers are'\n==============================="
num1_msg:    .asciiz "\nFirst number: "
num2_msg:    .asciiz "\nSecond number: "

.text
.globl main

main:
    li $v0, 4               
    la $a0, prompt_num1       
    syscall               

    li $v0, 5             
    syscall               
    move $t0, $v0             

    li $v0, 4                
    la $a0, prompt_num2       
    syscall              

    li $v0, 5               
    syscall                 
    move $t1, $v0            
    # Swap the numbers using XOR operation
    xor $t0, $t0, $t1         
    xor $t1, $t0, $t1         
    xor $t0, $t0, $t1         

    li $v0, 4               
    la $a0, result_msg        
    syscall                  
    #first number after swapping
    li $v0, 4                 
    la $a0, num1_msg          
    syscall                  
    li $v0, 1                 
    move $a0, $t0             
    syscall                  
    #second number after swapping
    li $v0, 4                 
    la $a0, num2_msg         
    syscall                   

    li $v0, 1                
    move $a0, $t1             
    syscall

    li $v0, 10 
    syscall
