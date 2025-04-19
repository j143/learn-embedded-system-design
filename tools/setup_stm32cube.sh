#!/bin/bash

# This script sets up the STM32CubeF4 package for STM32F4xx development using the official GitHub repository.

# Define variables
STM32CUBE_REPO="https://github.com/STMicroelectronics/STM32CubeF4.git"
LIB_DIR="/workspaces/learn-embedded-system-design/projects/timer_blink/lib"
INCLUDE_DIR="/workspaces/learn-embedded-system-design/projects/timer_blink/include"
BRANCH="v1.27.0" # Specify the targeted version

# Create necessary directories
echo "Creating directories..."
mkdir -p $LIB_DIR
mkdir -p $INCLUDE_DIR

# Clone STM32CubeF4 repository with submodules
echo "Cloning STM32CubeF4 repository..."
git clone --recursive --depth 1 --branch $BRANCH $STM32CUBE_REPO $LIB_DIR

# Copy CMSIS and HAL headers to include directory
echo "Copying CMSIS and HAL headers to include directory..."
cp -r $LIB_DIR/Drivers/CMSIS/Device/ST/STM32F4xx/Include/* $INCLUDE_DIR
cp -r $LIB_DIR/Drivers/CMSIS/Include/* $INCLUDE_DIR

# Verify setup
echo "Verifying setup..."
if [ -d "$INCLUDE_DIR" ]; then
    echo "STM32CubeF4 setup completed successfully."
else
    echo "STM32CubeF4 setup failed. Please check the script and try again."
fi