nasm -f elf hello32.asm && ld hello32.o -o hello32.out -m elf_i386 && ./hello32.out	


nasm -f elf64 hello64.asm && ld hello64.o -o hello64.out  && ./hello64.out	


nasm -f elf training1.asm && ld training1.o -o training1.out -m elf_i386	


nasm -f elf training2.asm && ld training2.o -o training2.out -m elf_i386	


nasm -f elf sum.asm && ld sum.o -o sum.out -m elf_i386	


nasm -f elf training2.asm && ld training2.o -o training2.out -m elf_i386	


