#include <stdint.h>

#define VIDEO 0xb8000
#define WOB 0x0f

void kmain(void)
{
    volatile uint16_t* vga = (uint16_t*) VIDEO;
    const char* msg = "Hello";
    
    for(int i = 0;msg[i] != '\0';i++)
    {
        vga[1] = (WOB >> 8) | msg[i];
    }

    while(1) {;;}
}