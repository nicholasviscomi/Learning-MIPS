.text
.globl main

main:
	# STDIN = 0# STDOUT = 1# STDERR = 2
	
	# print string
	li $v0, 4 # setup for write syscall
	la $a0, msg # load address of msg into buffer for syscall
	syscall
	
	# print char
	li $v0, 4
	la $a0, char
	syscall
	
	# print int
	li $v0, 1 # setup for printing integer
	lw $a0, age # lw = load word (the name for integer)
	syscall
	
	# print float
	li $v0, 2 # 2 = code to print float
	lwc1 $f12, pi # load into coprocessor 1 (holds floats)
	syscall
	
	# print double
	ldc1 $f2, double
	ldc1 $f0, zeros # doubles take two registers (hence the name)
	
	li $v0, 3 # 3 = print double
	add.d $f12, $f2, $f0
	syscall
	
	# exit correctly
	li $v0, 10
	li $a0, 0
	syscall
	
.data

msg: .asciiz "Hello World!\n"
char: .byte 'a'
age: .word 17
pi: .float 3.1415
double: .double 4.214
zeros: .double 0.0
