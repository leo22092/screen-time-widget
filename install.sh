#!/bin/bash
set -e
INSTALL_DIR="$HOME/.screen_time_widget"

echo "Installing Screen Time Widget..."

# Check if conky exists
if ! command -v conky >/dev/null 2>&1; then
    echo "Conky not found. Installing..."

    if command -v apt >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y conky

    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy conky

    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y conky

    else
        echo "Unsupported package manager."
        echo "Please install Conky manually."
        exit 1
    fi
fi

mkdir -p "$INSTALL_DIR"

cp screen_time.sh "$INSTALL_DIR/"
cp screen_time.conkyrc "$INSTALL_DIR/"

chmod +x "$INSTALL_DIR/screen_time.sh"

echo ""
echo "Installation complete."
echo ""
echo "Run widget using:"
killall conky 2>/dev/null

echo "conky -c $INSTALL_DIR/screen_time.conkyrc &"
