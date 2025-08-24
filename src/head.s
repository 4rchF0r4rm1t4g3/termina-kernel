/*set constants for multiboot header*/
.set ALIGN, 1<<0
.set MEMINFO, 1<<1
.set FLAGS, ALIGN | MEMINFO
.set MAGIC, 0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)


// mark program as kernel
.section .multiboot
.align 4
.long FLAGS
.long MAGIC
.long CHECKSUM

//define esp 16384
.section .bss
.align 16
stack_bottom:
    .skip 16384
stack_top:

//load _start
.section .text:
.global _start
.type _start, @function
_start:
    //set esp c cannot fucntion without esp
    mov $stack_top, %esp

    call kmain

    cli
1:  hlt
    jmp 1b

.size _start, .-_start
