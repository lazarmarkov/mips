    .text
main:
    addi    $sp, $sp, -8
    addi    $s0, $0, 5
    sw      $s0, 4($sp) # x=5
    addi    $s1, $0, 7
    sw      $s1, ($sp) # y=7
    
    la      $a0, 4($sp)
    la      $a1, ($sp) 

    jal swap
    
    lw $t0, ($a0)
    lw $t1, ($a1)

    li  $v0, 1

    move $a0, $t0
    syscall

    move $a0, $t1
    syscall

    addi $sp, $sp, 8

    li $v0, 10
    syscall

swap:
    addi $sp, $sp, -4
    sw $s0, ($sp)
    
    add $s0, $0, $a0 
    add $a0, $0, $a1
    add $a1, $0, $s0

    lw $s0, ($sp)
    addi $sp, $sp, 4
    jr $ra
