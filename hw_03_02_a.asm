.data
prompt_x:  .asciiz "Enter the value for 'x': "
prompt_y:  .asciiz "Enter the value for 'y': "
prompt_z:  .asciiz "Enter the value for 'z': "
result_msg: .asciiz "The result of '5x + 3y + z' is: "

.text
.globl main

main:
    li      $v0, 4              
    la      $a0, prompt_x       
    syscall                     

    li      $v0, 5              
    syscall                     
    move    $t0, $v0            

    li      $v0, 4              
    la      $a0, prompt_y       
    syscall                     

    li      $v0, 5              
    syscall                     
    move    $t1, $v0           

    li      $v0, 4              
    la      $a0, prompt_z       
    syscall                     

    li      $v0, 5              
    syscall                     
    move    $t2, $v0           

    # Calculation of "5x"
    li      $t3, 5              
    mult    $t0, $t3         
    mflo    $t4              

    # Calculation of "3y"
    li      $t3, 3              
    mult    $t1, $t3            
    mflo    $t5                

    # Calculation of "5x + 3y"
    add     $t6, $t4, $t5       

    # Calculation of "5x + 3y + z"
    add     $t7, $t6, $t2       

    li      $v0, 4              
    la      $a0, result_msg     
    syscall                    

    li      $v0, 1              
    move    $a0, $t7          
    syscall                    

    li      $v0, 10             
    syscall                    
