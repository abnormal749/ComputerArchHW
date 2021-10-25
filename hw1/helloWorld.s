# hello world
.global _start

_start:
  la   a0, str
  li   a7, 4
  ecall
  lw   s1, num
  add  a0, s1, zero
  li   a7, 1
  ecall
  li   a7, 10
  ecall

.data
str: .string "Hello World!"
num: .word 4
.text
