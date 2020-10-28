#------------------------------
# DICE ROLLER
#------------------------------

.data    
#-----------------------------
#This is the data segment
#-----------------------------
dragonStr: .asciiz "Dragon "
swordStr: .asciiz "Sword "
orcStr: .asciiz "Orc "

 
.text 
#-------------------------------
#This is the body of the code
#-------------------------------
 
main:
 
#--------------------------------------------------------------
# Setup number generator and loop
#--------------------------------------------------------------

# Set RNG maximum
li $a1, 12

# Set maximum number of loop iterations
li $t1, 2


#--------------------------------------------------------------
# Enter loop that controls all dice rolls and logic
#--------------------------------------------------------------
loop:

# Add 1 to t0 to keep count of number of loops that have passed
addi $t0, $t0, 1

# Seed number generator
li $a0, 3 

# Generate random number
li $v0, 42
syscall

# Move the random number to $s0
move $s0, $a0


#--------------------------------------------------------
# Logic to control where to jump based on random number
# <=4 Dragon, <=7 Sword, <=11 Orc
#--------------------------------------------------------
ble $s0, 4, dragon
ble $s0, 7, sword
ble $s0, 11, orc


#--------------------------------------------------------
# Labels for each possible roll
#--------------------------------------------------------
dragon:
# Print dragon result
la $a0, dragonStr
li $v0, 4
syscall
# Jump to loopend
j loopend

sword:
# Print sword result
la $a0, swordStr
li $v0, 4
syscall
# Jump to loopend
j loopend

orc:
# Print orc result
la $a0, orcStr
li $v0, 4
syscall
# Jump to loopend
j loopend


#---------------------------------------------------------------------------
# Handles whether to reroll or exit. 
# If the loop counter is less than the max (2): roll again. Otherwise exit.
#---------------------------------------------------------------------------
loopend:
beq $t0, $t1, exit
j loop

exit:
#
# system call code for exit = 10
# 
li $v0, 10		
syscall				  
