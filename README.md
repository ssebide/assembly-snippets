# Assembly Code Snippets

This repository contains refactored assembly code snippets for both **MASM (Windows)** and **NASM (Linux)** environments.

## Overview

The purpose of this collection is to demonstrate various assembly language concepts, including arithmetic operations, control structures, string manipulation, file I/O, and Windows API integration. All files have been standardized with consistent headers, formatting, and comments.

## Directory Structure

- **MASM (Windows 32-bit):** Uses `Irvine32` library and `stdcall` convention.
- **NASM (Linux 32-bit):** Uses Linux syscalls.

## File Index

### MASM (Windows)

#### Arithmetic & Logic
- `AddSubAlt.asm`: Alternative addition/subtraction.
- `addsub.asm`: Basic addition/subtraction.
- `addsub2.asm`: More addition/subtraction.
- `sum.asm`: Calculating sums.
- `sumArray.asm`: Summing an array.
- `RowSum.asm`: Calculating row sums in a matrix.
- `Factorial.asm`: Recursive factorial calculation.
- `translate.asm`: Translating algebraic expressions.

#### Control Structures
- `conditionals.asm`: If, Else-If, and logical operators.
- `Finite.asm`: Finite State Machine example.
- `Endless.asm`: Infinite recursion demonstration.
- `InputLoop.asm`: Input validation loop.

#### Arrays & Sorting/Searching
- `ArrayScan.asm`: Scanning arrays.
- `FillArray.asm`: Filling arrays with random numbers.
- `PrtArray.asm`: Printing arrays.
- `BubbleSort.asm`: Bubble sort algorithm.
- `BinarySearch.asm`: Binary search algorithm.
- `B_main.asm`: Main driver for sorting/searching demo.
- `Bsearch.inc`: Prototypes for search/sort procedures.

#### String Manipulation
- `copystr.asm`: Copying strings.
- `RevStr.asm`: Reversing strings.
- `StringDemo.asm`: Demonstrating string library functions.

#### File I/O
- `CreateFile.asm`: Creating and writing files.
- `ReadFile.asm`: Reading files.
- `ReadConsole.asm`: Reading from console handle.
- `_prompt.asm`: User prompt procedure.

#### System & Windows API
- `Dateime.asm`: System date/time operations.
- `Timer.asm`: Execution timer using `GetTickCount`.
- `HeapTest.asm`: Windows Heap management.
- `MessageBox.asm`: Windows MessageBox variations.
- `WinApp.asm`: Full Windows GUI application.
- `WriteColors.asm`: Console text colors and attributes.
- `Scroll.asm`: Console scrolling and resizing.

#### Miscellaneous
- `Encrypt.asm`: Simple XOR encryption.
- `Walk.asm`: Drunkard's Walk simulation.
- `Template.asm`: Standard program template.
- `variables.asm`: Local variables and stack frames.
- `TestLib2.asm`: Library testing (Random).
- `TestLib3.asm`: Library testing (Timing).
- `sum_main.asm`: Multi-module summation example.

### NASM (Linux)

- `nasm-arithmetic.asm`: Arithmetic operations.
- `nasm-arrays.asm`: Array manipulation.
- `nasm-constants.asm`: Defining and using constants.
- `nasm-files.asm`: File I/O operations.
- `nasm-logical.asm`: Logical instructions (AND, OR, XOR).
- `nasm-loops.asm`: Loop structures.
- `nasm-macros.asm`: Macro definitions and usage.
- `nasm-memory.asm`: Memory allocation and access.
- `nasm-numbers.asm`: Number processing.
- `nasm-recursion.asm`: Recursive functions.
- `nasm-variables.asm`: Variable declaration and usage.

## Build Instructions

### MASM
Requires MASM32 SDK and Irvine32 library.
```cmd
ml /c /coff /Zi file.asm
link /SUBSYSTEM:CONSOLE /DEBUG /LIBPATH:c:\irvine file.obj irvine32.lib kernel32.lib user32.lib
```

### NASM
Requires NASM and GCC (for linking).
```bash
nasm -f elf32 file.asm -o file.o
ld -m elf_i386 -o file file.o
```
