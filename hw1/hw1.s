# THIS IS ASSEMBLY FOR THE 904th PROBLEM ON LEETCODE.
# Author: Matthew Chen

.data
trees: .word 3,3,3,1,4   #Line of trees
len:   .word 5           #Length
str:   .string "The answer is "
.text


main:
    lw   s1, len
    addi t1, zero, 3
    blt  s1, t1, lessThanThree
    addi s2, zero, 1  #max
    addi s3, zero, 1  #tempMax
    addi s4, zero, 1  #cnum
    la   s5, trees
    lw   s6, 0(s5)    #temp1
    addi s5, s5, 4
    lw   s7, 0(s5)    #temp2
    la   s5, trees
    addi s9, zero, 1  #i? counter

loop:
    lw   t1, 0(s5)    #t1 = fruits[i-1]
    addi s5, s5, 4
    lw   t2, 0(s5)    #t2 = fruits[i]
    beq  t2, s6, oldFruit
    beq  t2, s7, oldFruit
    addi s6, t1, 0    #temp1 = fruits[i-1]
    addi s7, t2, 0    #temp2 = fruits[i]
    addi s3, s4, 1    #tempmax = cnum + 1
loop1:
    blt  s2, s3, maxUpdate
loop2:
    addi s9, s9, 1
    beq  s9, s1, finishP
    bne  t1, t2, newCounter
    addi s4, s4, 1
    j loop

oldFruit:
    addi s3, s3, 1    #tempmax += 1
    j loop1

newCounter:
    addi s4, zero, 1  #cnum reset
    j loop

maxUpdate:
    addi s2, s3, 0    #max = tempmax
    j loop2

lessThanThree:
    add a0, s1, zero
    li a7, 1          #print size
    ecall
    li a7, 10         #end program
    ecall

finishP:
    la a0, str        #string
    li a7, 4          #print string
    ecall
    add a0, s2, zero  #load answer
    li a7, 1          #print max
    ecall
    li a7, 10         #end program
    ecall
