.text 

.globl main

	main:
		
		addi $a1, $0, 76 # a1 is the register for arguments
		addi $a2, $0, 24 
		jal addNumbers
		
		li $v0, 1
		move $a0, $v1
		syscall
		
		# exit
		li $v0, 10
		syscall
		
	addNumbers:
		add $v1, $a1, $a2 # v1 is where returned values go. Can be accessed in other function
		jr $ra # return


.data
