# Description: Enter the value of Z from the console, and 
# Perform (X + Y) * 6 / ((10 * Z )- 1), where X, Y, and Z are floating point numbers
.data
x: .float 1.50
y: .float 9.99
z: .float 0.00
prompt:     .asciiz "Example of program performing  (X + Y) * 6 / ((10 * Z )- 1), where X, Y, and Z are floating point numbers \n"

.text
main:
la  $a0, prompt
li  $v0, 4
syscall

# Input Z
li $v0, 6
syscall
swc1 $f0, z

###############################################
# Your code here:
lwc1 $f1, y
lwc1 $f2, x

# Using the specifiedd constants
# You have to initialize them by 
# putting em into memory and manipulate 
# em using pointers. Don't ask why it has 
# to be like that.
la $t0, 6
la $t1, 10
la $t2, 1

mtc1 $t0, $f3   # 6
mtc1 $t1, $f4   # 10
mtc1 $t2, $f5   # 1

cvt.s.w $f3,$f3 # 6
cvt.s.w $f4,$f4 # 10
cvt.s.w $f5,$f5 # 1

add.s $f2, $f2, $f1  # X = X + Y

mul.s $f2, $f2, $f3  # X = X * 6

mul.s $f0, $f0, $f4  # Z = Z * 10

sub.s $f0, $f0, $f5  # Z = Z - 1

div.s $f12, $f2, $f0  # X = X / Z

li $v0, 2
syscall

###############################################

# Exit the program
li $v0, 10
syscall