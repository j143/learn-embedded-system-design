#!/bin/bash

# This script installs the necessary dependencies for building and running STM32F4xx projects.

# Update package list
echo "Updating package list..."
sudo apt update

# Install ARM GCC toolchain
echo "Installing ARM GCC toolchain..."
sudo apt install -y gcc-arm-none-eabi

# Install OpenOCD for debugging
echo "Installing OpenOCD..."
sudo apt install -y openocd

# Install QEMU for emulation
echo "Installing QEMU..."
sudo apt install -y qemu-system-arm

# Verify installations
echo "Verifying installations..."
arm-none-eabi-gcc --version && echo "ARM GCC installed successfully."
openocd --version && echo "OpenOCD installed successfully."
qemu-system-arm --version && echo "QEMU installed successfully."

echo "All dependencies installed successfully!"