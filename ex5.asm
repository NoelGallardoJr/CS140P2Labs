.data
  K: .word  30
  A: .word  5, 10, 25, 25, 45
  idx: .word 0

.text
.globl main

main:
  la $t0, A           # t0: the starting address of array A
  lw $t3, K
  ori $t1, $zero, 0


loop:
	add		$t2, $t2, $t0	 # t2 = address of A[i]	
  lw		$t2, 0($t2) # t2 = A[i]

	slt		$t4, $t3, $t2	 # k < A[i] 
	bne		$t4, $0, exit 

	addi	$t1, $t1, 1 	
	sll		$t2, $t1, 2
 j	loop	 

exit:
  sw $t1, idx
  li $v0, 1
  move $a0, $t1
syscall
 
 li $v0, 10
 syscall