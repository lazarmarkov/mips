    .text
main:
    addi $a0, $0, 5
    addi $a1, $0, 7

    jal swap
    
    li  $v0, 1
    syscall
    
    move $a0, $a1
    syscall

    li $v0, 10
    syscall

swap:
    addi $sp, $sp, -4
    sw $s0, ($sp)
    
    add $s0, $0, $a0
    add $a0, $0, $a1
    add $a1, $0, $s0

    lw $s0, ($sp)
    jr $ra
