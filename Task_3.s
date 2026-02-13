    .section .bss
    .globl  ram
    .comm   ram, 256, 1          # 256 bytes of RAM (uninitialized)

    .section .text               # Make function visible to C program
    .globl  fill_ram
fill_ram:
    # Clear RAM locations 50H - 58H (write 00h)
    leaq    ram+0x50, %rdi       # rdi = &ram[0x50]
    movl    $9, %ecx             # 9 bytes: 0x50..0x58

.Lloop:
    movb    $0x00, (%rdi)        # *rdi = 0
    incq    %rdi                 # rdi++
    loop    .Lloop               # ecx-- ; if ecx != 0, jump
    ret

    .section .note.GNU-stack,"",@progbits
