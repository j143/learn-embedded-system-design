/* Linker script for STM32F4xx */
MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1M
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
    KEEP(*(.init))
    KEEP(*(.fini))
  } > FLASH

  .data : AT (__data_load_start__)
  {
    __data_start__ = .;
    *(.data*)
    __data_end__ = .;
  } > RAM

  .bss :
  {
    __bss_start__ = .;
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;
  } > RAM

  .stack (NOLOAD) :
  {
    . = ALIGN(8);
    __stack_top__ = .;
    . += 0x400; /* 1KB stack */
    __stack_limit__ = .;
  } > RAM
}