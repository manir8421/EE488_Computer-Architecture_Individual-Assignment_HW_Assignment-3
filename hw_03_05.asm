.data
prompt_num1: .asciiz "Enter the first number: "
prompt_num2: .asciiz "Enter the second number (prime number): "

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
    # Check if the second number is a prime factor of the first number
    div $t0, $t1             
    mfhi $t2                 
    # If remainder is 0, the second number is a prime factor of the first
    bnez $t2, not_prime_factor 
    # Return 0 (second number is a prime factor)
    li $v0, 1                 
    li $a0, 0                
    syscall                  

    li $v0, 10               
    syscall    

not_prime_factor:
    li $v0, 1                 
    li $a0, 99                
    syscall                   

    li $v0, 10                
    syscall                   