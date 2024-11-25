.data

N:
.word 5
M:
.word 4
matrix:
.word 1, 4, 8, 8, -322
.word 10, 238, 12, 83, -1234
.word -12, -45, 12, -435, 0
.word -100, 100, -1311, 235, 0
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a2, result
call print
call exit

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M
lw t5, 0(a4) # matix
addi t4, x0, 0 # row pointer

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4)
addi a4, a4, 4
addi t3, t3, 1
blt t6, t5, skip_load
mv t5, t6
skip_load:
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
sw t5, 0(a5)
ret

print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a2)
ecall
ret

exit:
addi a0, x0, 10
ecall