    .section .bss
    .globl  ram
    .comm   ram, 256, 1          # 256 bytes of RAM (uninitialized)

    .section .text                  
    .globl  fill_ram             # Make function visible to C program 
fill_ram:
    # Compute 1 + 2 + ... + 10 and store result at RAM[50h]
    xorl    %eax, %eax           # sum = 0
    movl    $1, %ecx             # i = 1

.Lsum:
    addl    %ecx, %eax           # sum += i
    incl    %ecx                 # i++
    cmpl    $11, %ecx            # stop when i == 11
    jne     .Lsum

    movb    %al, ram+0x50        # store low byte of sum into RAM[50h]
    ret

    .section .note.GNU-stack,"",@progbits
