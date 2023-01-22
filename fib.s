# Fibonacci example

    .data
n:  .word  6

    .text
main:
    lw      $a0, n
    jal     fib
    add     $t0, $0, $v0

    add     $a0, $0, $v0
    li      $v0, 1
    syscall

    li      $v0, 10
    syscall

fib:
    add     $s0, $0, $a0

    addi    $sp, $sp, -8
    sw      $ra, 4($sp)
    sw      $s0, ($sp)

    addi    $v0, $0, 1
    beq     $s0, 0, fib_done    # if( n==0 ) return 1;

    add     $a0, $s0, -1
    jal     fib

    lw      $s0, ($sp)

    mult    $s0, $v0
    mflo    $v0

fib_done:
    lw      $ra, 4($sp)
    addi    $sp, $sp, 8
    jr      $ra


