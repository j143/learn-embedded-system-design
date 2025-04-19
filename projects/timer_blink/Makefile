# Makefile for 01_blinky project

TARGET = timer_blink
BUILD_DIR = build

# Toolchain
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
SIZE = arm-none-eabi-size

# Directories
SRC_DIR = src
INCLUDE_DIR = include
LINKER_DIR = linker
STARTUP_DIR = startup

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.c)
SRCS += $(wildcard $(STARTUP_DIR)/*.s)

# Object files
OBJS = $(SRCS:%.c=$(BUILD_DIR)/%.o)
OBJS += $(SRCS:%.s=$(BUILD_DIR)/%.o)

# Flags
CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -g -O0 -I$(INCLUDE_DIR)
CFLAGS += -DSTM32F401xE
LDFLAGS = -T$(LINKER_DIR)/STM32F4xx.ld
LDFLAGS += -Llib/Drivers/STM32F4xx_HAL_Driver -lstm32f4xx_hal

# Rules
all: $(BUILD_DIR)/$(TARGET).elf

$(BUILD_DIR)/$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)
	$(SIZE) $@

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean