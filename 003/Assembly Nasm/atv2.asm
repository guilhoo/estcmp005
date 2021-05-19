SECTION .data

msg_a db 'O primeiro é maior',0xa
len_a equ $ - msg_a

msg_b db 'O segundo é maior',0xa
len_b equ $ - msg_b

msg_eq db 'Os números são iguais',0xa
len_eq equ $ - msg_eq

SECTION .text

global _start

b_bigger:
 mov edx, len_b ;message length
 mov ecx, msg_b ;message to write
 mov ebx, 1   ;file descriptor (stdout)
 mov eax, 4   ;system call number (sys_write)
 int 0x80    ;call kernel
 jmp finish

a_bigger:
 mov edx, len_a ;message length
 mov ecx, msg_a ;message to write
 mov ebx, 1   ;file descriptor (stdout)
 mov eax, 4   ;system call number (sys_write)
 int 0x80    ;call kernel
 jmp finish
 
equal:
  mov edx, len_eq ;message length
  mov ecx, msg_eq ;message to write
  mov ebx, 1   ;file descriptor (stdout)
  mov eax, 4   ;system call number (sys_write)
  int 0x80    ;call kernel
  jmp finish

_start:
  mov eax, 1
  mov ebx, 100
  cmp eax, ebx
  jg a_bigger
  jl b_bigger
  jmp equal

finish:
  mov eax, 1          ; Syscall 1 (sys_exit)
  int 0x80
