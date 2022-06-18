.text
.globl main

main:
	# addition
	addi $t0, $zero, 10
	addi $t1, $zero, 5 # load in the numbers
	
	add $t2, $t0, $t1 # add t0 and t1, then put it into t2
	
	li $v0, 1
	move $a0, $t2 
	syscall
	
	jal print_new_line
	
	# subtraction
	addi $s0, $zero, 10
	addi $s1, $zero, 5 # load in the numbers
	
	sub $s2, $s1, $s0 # s2 = s1 - s0 
	
	li $v0, 1
	move $a0, $s2 
	syscall
	
	jal print_new_line
	
	# multiply
	addi $s0, $zero, 10 # use an inline number for addition
	addi $s1, $zero, 4
	
	mul $t0, $s0, $s1 # t0 = s0 * s1
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	jal print_new_line
	
	# divide evenly
	addi $t0, $zero, 30
	addi $t1, $zero, 5
	
	div $a0, $t0, $t1 # just immediately put the value into a0 so it can be printed
	li $v0, 1
	syscall
	
	jal print_new_line
	
	# divide unevenly
	div $t0, $t1
	mflo $s0 # move from low. This is the quotient
	mfhi $s1 # move from high. This is the remainder
	
	li $v0, 4
	la $a0, quotient
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	jal print_new_line
	
	li $v0, 4
	la $a0, remainder
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall	
	
	
	# exit correctly
	li $v0, 10
	li $a0, 0
	syscall
	
print_new_line:
	li $v0, 4
	la $a0, new_line
	syscall
	
	jr $ra # return
	
.data

new_line: .asciiz "\n"
quotient: .ascii "Q: "
remainder: .ascii "R: "