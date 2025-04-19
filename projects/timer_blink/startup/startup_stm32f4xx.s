/* Startup file for STM32F4xx */
.section .isr_vector,"a",%progbits
.global _start

_start:
  .word 0x20020000 /* Initial stack pointer */
  .word Reset_Handler /* Reset handler */
  .word NMI_Handler /* NMI handler */
  .word HardFault_Handler /* Hard fault handler */
  .word Default_Handler /* Other exceptions */
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler
  .word Default_Handler

/* Reset handler */
.type Reset_Handler, %function
Reset_Handler:
  ldr r0, =_start
  bl main
  b .

/* Default handlers */
.type Default_Handler, %function
Default_Handler:
  b .

/* Weak aliases for handlers */
.weak NMI_Handler
NMI_Handler = Default_Handler
.weak HardFault_Handler
HardFault_Handler = Default_Handler