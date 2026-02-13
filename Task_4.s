    .section .bss
    .globl  ram
    .comm   ram, 256, 1          # 256 bytes of RAM (uninitialized)

    .section .text                  
    .globl  fill_ram             # Make function visible to C program 
fill_ram:
    # Compute 1 + 2 + ... + 10 and store result at RAM[50h]
    xorl    %eax, %eax          
    movl    $1, %ecx             

.Lsum:
    addl    %ecx, %eax          
    incl    %ecx                 
    cmpl    $11, %ecx           
    jne     .Lsum

    movb    %al, ram+0x50       
    ret

    .section .note.GNU-stack,"",@progbits
