.data
prompt:     .asciiz "Enter an integer value: "
result_msg: .asciiz "The result of multiplying by 10 using shifts and addition is: "
verify_msg: .asciiz "\nVerification using 'mult' and 'mflo' operators, result is: "

.text
.globl main

main:
    li      $v0, 4              
    la      $a0, prompt         
    syscall                     

    li      $v0, 5              
    syscall                     
    move    $t0, $v0            

    # Multiply input by 10 using bit shifts and addition
    sll     $t1, $t0, 3         
    sll     $t2, $t0, 1         
    add     $t3, $t1, $t2       

    li      $v0, 4              
    la      $a0, result_msg     
    syscall                     

    li      $v0, 1              
    move    $a0, $t3            
    syscall                     

    # Verify using mult and mflo operators
    li      $v0, 4              
    la      $a0, verify_msg     
    syscall                     

    li      $t4, 10             
    mult    $t0, $t4            
    mflo    $t5                 

    li      $v0, 1              
    move    $a0, $t5           
    syscall                    

    li      $v0, 10             
    syscall                    
