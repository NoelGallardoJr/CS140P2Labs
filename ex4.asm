.data
  N: .word  5
  A: .word  1, 2, 3, 4, 5
  sum: .word 0
.text
.globl main

main:

 la $t0, A
 li $t1, 0
 lw $t2, N 
 li $t3, 0 


loop:
  sll $t5, $t3, 2     # $t5 = i * 4
  add $t5, $t0, $t5   # $t5 = address of A[i]
  lw $t6, 0($t5)      # $t6 = A[i]
  add $t1, $t1, $t6   # sum += A[i]

  addi $t3, $t3, 1    # i++
  bne $t3, $t2, loop  # if i != N, continue

  li $v0, 1           # syscall to print int
  move $a0, $t1
  syscall

  li $v0, 10          # exit
  syscall