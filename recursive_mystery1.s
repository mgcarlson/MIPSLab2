#Students: Maddie Carlson, Ryan Raad, Alex Caulin-Cardo
#Percent of effort : Maddie Carlson: 33%, Ryan Raad: 33%, Alex Caulin-Cardo: 33%


.data
list1:		.word		3, 9, 1, 2, 6, 3, -4, -7, -8, 4, -2,  8, 7, 6
.text 		# list1 is an array of integers storing the given sequence of values	 
.globl	tomato
tomato: 
addi	$sp, $sp, -8                #Making room in stack
addi	$t0, $a0, -1                #Storing some sort of index? (length -1)
sw  	$t0, 0($sp)
sw  	$ra, 4($sp)        
bne 	$a0, $zero, orange   
li  	$v0, 0             
addi	$sp, $sp, 8        
jr 	$ra                  
orange:   
move  $a0, $t0            
jal   	tomato 
lw    	$t0, 0($sp)  
sll	$t1, $t0, 2  
add   	$t1, $t1, $a1     
lw    	$t2, 0($t1)       
add   	$v0, $v0, $t2     
lw    	$ra, 4($sp)                
addi 	$sp, $sp, 8        
jr 	$ra                  
# main function starts here                                            						
.globl main
main:	
    addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address
	la	$a1, list1	# a1 has the base address pointing to the first 
# element of the “list1” array declared in .data section above
	li	$a0, 9		# loads the immediate value into the destination register
	jal	tomato	
return:	
li	$v0, 0			# Return value
	lw	$ra, 0($sp)		# Restore return address
	addi	$sp, $sp, 4		# Restore stack pointer
	jr 	$ra			# Return
# Step through this code in your simulator and monitor the register values. 
# What does the tomato function do?   
# Passing in a counter that goes from 8 to 0 inclusivez( which will eventually let us acccesss the first 9 values of list 1) and return address into stack, to be able to pull out counter and return address values in orange function. Then we use these values with proper 4 byte offset in order to access actual values in list 1 , storing those into $t2, and summing those first 9 values in $v0. This particular list ends with a sum value of 5. #
