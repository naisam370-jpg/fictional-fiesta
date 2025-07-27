
# 🎵 YouTube to MP3 Downloader (GUI)

A simple and user-friendly GUI application to download YouTube videos as high-quality MP3 files using `yt-dlp`, `tkinter`, and `ffmpeg`.

---

## 📦 Files Included

- `ytmp3install.py` – Main Python GUI application
- `setup.bat` – Setup script for **Windows**
- `setup.sh` – Setup script for **Linux/macOS**

---

## 🖥️ Windows Setup

### 1. ✅ Install Python

Download and install Python from: [https://www.python.org/downloads/](https://www.python.org/downloads/)

Make sure to check **"Add Python to PATH"** during installation.

Verify installation:

```cmd
python --version
```

---

### 2. 🎵 Install FFmpeg

- Download from [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)
- Extract the ZIP file
- Add the `bin` folder to your system `PATH`

Verify:

```cmd
ffmpeg -version
```

---

### 3. ⚙️ Run Setup Script

1. Right-click on `setup.bat`
2. Choose **Run as Administrator**
3. Follow prompts to:
   - Create a virtual environment (optional)
   - Install required Python packages
   - Check for FFmpeg and Tkinter

---

### 4. 🚀 Run the App

If using a virtual environment:

```cmd
call venv\Scripts\activate
python ytmp3install.py
```

If not:

```cmd
python ytmp3install.py
```

---

## 🐧 Linux / macOS Setup

### 1. ✅ Install Python 3 and Tkinter

#### On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install python3 python3-pip python3-tk
```

#### On macOS:

```bash
brew install python3
```

---

### 2. 🎵 Install FFmpeg

#### On Ubuntu/Debian:

```bash
sudo apt install ffmpeg
```

#### On macOS:

```bash
brew install ffmpeg
```

---

### 3. ⚙️ Run Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

This will:
- Create a virtual environment (optional)
- Install `yt-dlp`
- Verify `ffmpeg` and `tkinter`

---

### 4. 🚀 Run the App

If using virtual environment:

```bash
source venv/bin/activate
python ytmp3install.py
```

Otherwise:

```bash
python3 ytmp3install.py
```

---

## ✅ Features

- GUI-based YouTube to MP3 downloader
- Automatic audio extraction using `yt-dlp`
- Converts audio to high-quality MP3 using FFmpeg
- Cross-platform (Windows, Linux, macOS)

---

## ⚠️ Troubleshooting

- **FFmpeg not found**: Ensure it's installed and added to your system PATH.
- **Tkinter error**: Install `python3-tk` (Linux) or use a Python distribution that includes it (Windows/macOS).
- **Permission issues**: On Windows, try running `setup.bat` as Administrator.

---

## 📃 License

This project is released under the MIT License.
