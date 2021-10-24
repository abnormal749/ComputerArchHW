# Bubble Sort

.data
list:  .word 0,2,7,4,5,6,3,8,1
len:   .word 9
cma:   .string ","
ent:   .string "\n"
.text


main:
    la    s1, list
    lw    s2, len
    addi  s9, s2, -1
    add   s3, zero, zero   # i = 0 (s3)
    add   s4, s1, zero     # t1 = list[i]  address (s4)
loop1:
    addi  s5, s3, 0        # j = i+1 (s5)
    add   s6, s4, zero     # t2 = list[j]  address (s6)
loop2:
    addi  s5, s5, 1
    addi  s6, s6, 4        # j = j+1
    lw    t1, 0(s4)        # value of list[i]
    lw    t2, 0(s6)        # value of list[j]
    ###
    add   a0, t1, zero 
    li    a7, 1
    ecall
    add   a0, t2, zero
    li    a7, 1
    ecall
    la    a0, cma
    li    a7, 4
    ecall
    ###
    blt   t1, t2, loop2_
    sw    t2, 0(s4)
    sw    t1, 0(s6)
loop2_:
    blt   s5, s9, loop2
    la    a0, cma
    li    a7, 4
    ecall
    addi  s3, s3, 1
    addi  s4, s4, 4        # i = i+1
    blt   s3, s9, loop1
    
    la    a0, ent          # new line
    li    a7, 4            # print
    ecall
showList:
    lw    t1, 0(s1)
    add   a0, t1, zero     # load  integer
    li    a7, 1            # print result
    ecall
    la    a0, cma          # speration
    li    a7, 4            # print
    ecall
    addi  s1, s1, 4
    addi  s2, s2, -1
    bgtz  s2, showList
    
    li   a7, 10           #end program
    ecall
