# MIPS-Dice-Roller
Simulates 2 dice rolls for a fantasy style game, rolls can either be Dragons, Swords or Orcs

The code works by using a main loop and branches that control which side of the dice should be outputted to the user. The three possible outcome strings are setup in the data segment for printing later on. $a1 is used to set the maximum number that can be generated to 11, as 0 is a possible number to be generated this sets the number of possibilities to 12. $t1 is set to 2 as this is the number of loops required for dice rolls, this could be changed to any number to allow more or less dice rolls. 

The main loop works by incrementing $t0, once this contains a value that is equal to the value in $t1 the code will jump out of the loop to the exit. The random number generator is seeded, and then called using syscall 42 with the maximum previously set. The outcome of this is moved in to $s1 for testing. The probability of each side can be set by testing how large the generated number is, using ‘ble’ branches the logic works as follows:

Number Generated    Branch to Label
0, 1, 2, 3, 4	      Dragon
5, 6, 7	            Sword
8, 9, 10, 11	      Orc

The amount of numbers in the ‘number generated’ column sets the probability that the given label will be called, and therefore the side will be outputted.
Within each label there is a jump to the ‘loopend’ label, this prevents the program continuing and outputting more sides that is set by the initial loop max. Loopend simply contains a beq instruction to exit the loop if the maximum has been hit, otherwise just to jump back to the beginning of the loop. The exit label runs a syscall 10 to end the program.
