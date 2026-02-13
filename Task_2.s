    .section .bss
    .globl  ram
    .comm   ram, 256, 1          # 256 bytes of RAM (uninitialized)

    .section .text
    .globl  fill_ram             # Make function visible to C program
fill_ram:
    # Store FFh into RAM locations 50H - 58H using indirect addressing
    leaq    ram+0x50, %rdi       # rdi = &ram[0x50]
    movl    $9, %ecx             # 9 bytes total: 0x50..0x58

.Lloop:
    movb    $0xFF, (%rdi)        # *rdi = 0xFF   (indirect)
    incq    %rdi                 # rdi++
    loop    .Lloop               # ecx-- ; if ecx != 0, jump
    ret

    .section .note.GNU-stack,"",@progbits
