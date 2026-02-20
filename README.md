# Lab 1/2 – GAS (Hello World + Tasks 1–4)

This repository contains:
A  Hello World program in x86-64 GAS (`print_hello.s`)
One C driver (`print_ram.c`) used to test assembly functions that modify a 256-byte RAM array (`ram[]`)
Four assembly files (`Task_1.s` to `Task_4.s`) for Tasks 1–4

## Files
- `print_hello.s` – prints “Hello, World!” 
- `print_ram.c` – C driver that calls `fill_ram()` and prints `ram[0x50]` through `ram[0x58]`
- `Task_1.s` – store `FFh` into RAM locations `50h`–`58h` using direct addressing
- `Task_2.s` – store `FFh` into RAM locations `50h`–`58h` using indirect addressing
- `Task_3.s` – clear RAM locations `50h`–`58h` (store `00h`)
- `Task_4.s` – compute `1 + 2 + ... + 10` and store result in RAM location `50h`

## How to Compile and Run

### Hello World
```bash
gcc -nostdlib -no-pie print_hello.s -o hello
./hello

gcc -no-pie Task_1.s print_ram.c -o task1
./task1

gcc -no-pie Task_2.s print_ram.c -o task2
./task2

gcc -no-pie Task_3.s print_ram.c -o task3
./task3

gcc -no-pie Task_4.s print_ram.c -o task4
./task4


