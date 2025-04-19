#include "stm32f4xx.h"
#include "system_stm32f4xx.h"

#define LED_PIN 5

void Timer2_Init(void);
void GPIO_Init(void);

volatile uint32_t timer_flag = 0;

int main(void) {
    SystemInit(); // Initialize the system clock
    GPIO_Init();
    Timer2_Init();

    while (1) {
        if (timer_flag) {
            timer_flag = 0;
            GPIOA->ODR ^= (1 << LED_PIN); // Toggle PA5 (LED)
        }
    }
}

void Timer2_Init(void) {
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; // Enable TIM2 clock
    TIM2->PSC = 16000 - 1; // Prescaler (16 MHz / 16000 = 1 kHz)
    TIM2->ARR = 1000 - 1;  // Auto-reload (1 kHz / 1000 = 1 Hz)
    TIM2->DIER |= TIM_DIER_UIE; // Enable update interrupt
    TIM2->CR1 |= TIM_CR1_CEN;  // Enable timer

    NVIC_EnableIRQ(TIM2_IRQn); // Enable TIM2 interrupt in NVIC
}

void GPIO_Init(void) {
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN; // Enable GPIOA clock
    GPIOA->MODER |= (1 << (LED_PIN * 2)); // Set PA5 as output
}

void TIM2_IRQHandler(void) {
    if (TIM2->SR & TIM_SR_UIF) { // Check update interrupt flag
        TIM2->SR &= ~TIM_SR_UIF; // Clear interrupt flag
        timer_flag = 1;
    }
}