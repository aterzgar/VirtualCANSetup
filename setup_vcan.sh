#!/bin/bash

# Step 1: Start and enable the systemd-networkd subsystem
sudo systemctl start systemd-networkd
sudo systemctl enable systemd-networkd

# Step 2: Create the virtual CAN network interface
echo "[NetDev]
Name=vcan0
Kind=vcan
MTUBytes=16
Description=Virtual CAN0 network interface" | sudo tee /etc/systemd/network/vcan0.netdev

# Step 3: Configure the virtual CAN network interface
echo "[Match]
Name=vcan0" | sudo tee /etc/systemd/network/my-vcan.network

# Reload the systemd-networkd configurations
sudo systemctl restart systemd-networkd

# Output message
echo "Virtual CAN network interface vcan0 setup completed."

# Install can-utils for testing
sudo apt install can-utils

# Instructions for testing
echo "Setup completed. To test, perform the following steps in two separate terminal windows:"
echo "1. In the first terminal, run: candump -tz vcan0"
echo "2. In the second terminal, run: cansend vcan0 123#00FFAA5501020304"
