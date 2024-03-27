# Virtual CAN Network Interface Setup

This script sets up a virtual CAN (Controller Area Network) network interface using `systemd-networkd` on a Linux system.

## Getting Started

1. Save the script to your Linux machine, for example as `setup-vcan.sh`.
2. Make the script executable:
    ```bash
    chmod +x setup-vcan.sh
    ```
3. Run the script with sudo privileges:
    ```bash
    sudo ./setup-vcan.sh
    ```

The script will start and enable `systemd-networkd`, create and configure a virtual CAN network interface named `vcan0`, and install `can-utils` for testing the setup.

## Testing

After setting up, test the virtual CAN interface using:

1. In one terminal, listen on `vcan0`:
    ```bash
    candump -tz vcan0
    ```
2. In another terminal, send a CAN frame:
    ```bash
    cansend vcan0 123#00FFAA5501020304
    ```

If configured correctly, the `candump` command should display the CAN frame sent by `cansend`.
