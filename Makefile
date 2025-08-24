cc := i686-elf-gcc
as := i686-elf-as
src := src
bld := build

full:
	${as} ${src}/head.s -o ${bld}/head.o
	${cc} -c ${src}/kernel.c -o ${bld}/kernel.o --std=gnu99 -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
	${cc} -T linker.ld -o ${bld}/kernel.bin -ffreestanding -O2 -nostdlib ${bld}/head.o ${bld}/kernel.o -lgcc -Wl,-e,kmain
	cp ${bld}/kernel.bin gnu-grub/boot/kernel.bin
	grub-mkrescue -o ${bld}/terminaos.iso gnu-grub/

kernel:
	${as} ${src}/head.s -o ${bld}/head.o
	${cc} -c ${src}/kernel.c -o ${bld}/kernel.o --std=gnu99 -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
	${cc} -T linker.ld -o ${bld}/kernel.bin -ffreestanding -O2 -nostdlib ${bld}/head.o ${bld}/kernel.o -lgcc -Wl,-e,kmain