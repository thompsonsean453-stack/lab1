    .section .bss
    .globl  ram
    .comm   ram, 256, 1          # 256 bytes of RAM (uninitialized)

    .section .text
    .globl  fill_ram             # Make function visible to C program
fill_ram:
    # Store FFh into RAM locations 50H - 58H using indirect addressing
    leaq    ram+0x50, %rdi       
    movl    $9, %ecx             

.Lloop:
    movb    $0xFF, (%rdi)        
    incq    %rdi              
    loop    .Lloop              
    ret

    .section .note.GNU-stack,"",@progbits
