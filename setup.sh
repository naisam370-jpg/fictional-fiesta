#!/bin/bash

echo "🔧 Setting up YouTube to MP3 Downloader..."

# Optional: Create a Python virtual environment
read -p "Would you like to use a virtual environment? (y/n): " use_venv
if [[ "$use_venv" =~ ^[Yy]$ ]]; then
    python3 -m venv venv
    source venv/bin/activate
    echo "✅ Virtual environment activated."
fi

# Update package list
echo "🔄 Updating package list..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew update
fi

# Install ffmpeg
echo "🎵 Installing ffmpeg..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install -y ffmpeg
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ffmpeg
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "⚠️ On Windows, please install FFmpeg manually and add it to PATH: https://ffmpeg.org/download.html"
fi

# Install Python packages
echo "📦 Installing Python dependencies..."
pip install --upgrade pip
pip install yt-dlp

# Check for tkinter
echo "🧱 Checking for tkinter..."
python3 -c "import tkinter" 2>/dev/null
if [[ $? -ne 0 ]]; then
    echo "🚧 tkinter not found. Installing..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt install -y python3-tk
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "✅ tkinter is included with Python on macOS."
    else
        echo "⚠️ Please install tkinter manually on your platform."
    fi
else
    echo "✅ tkinter is already installed."
fi

echo "✅ Setup complete! Run your script with:"
if [[ "$use_venv" =~ ^[Yy]$ ]]; then
    echo "source venv/bin/activate && python your_script.py"
else
    echo "python your_ytmp3installer.py"
fi
