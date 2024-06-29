.data
prompt: .asciiz "Enter the integer value: "

.text
.globl main

main:
    li $v0, 4            
    la $a0, prompt      
    syscall             

    li $v0, 5            
    syscall             
    move $t0, $v0        

    # Check if the number is even or odd using sll and srl
    srl $t1, $t0, 1      
    sll $t1, $t1, 1      
    sub $t2, $t0, $t1   

    # Check the result and return 0 or 1 directly
    beq $t2, $zero, set_even   
    li $v0, 1                 
    li $a0, 1                 
    syscall                  
    j end_program             

set_even:
    li $v0, 1                 
    li $a0, 0                
    syscall                   

end_program:
    li $v0, 10               
    syscall                  
