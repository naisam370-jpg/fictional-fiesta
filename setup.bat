@echo off
setlocal enabledelayedexpansion

echo =====================================================
echo YouTube to MP3 Downloader - Windows Setup
echo =====================================================

:: Ask about virtual environment
set /p use_venv=Do you want to use a Python virtual environment? (y/n): 
if /i "%use_venv%"=="y" (
    echo Creating virtual environment...
    python -m venv venv
    call venv\Scripts\activate
    echo Virtual environment activated.
)

:: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Install yt-dlp
echo Installing yt-dlp...
pip install yt-dlp

:: Check tkinter availability
echo Checking tkinter...
python -c "import tkinter" >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Tkinter is not installed. You may need to install it manually.
) else (
    echo Tkinter is available.
)

:: Check if ffmpeg is in PATH
where ffmpeg >nul 2>&1
if errorlevel 1 (
    echo [WARNING] FFmpeg not found in PATH.
    echo Please download it from: https://ffmpeg.org/download.html
    echo And add the 'bin' folder to your system PATH.
) else (
    echo FFmpeg is installed and in PATH.
)

echo.
echo ✅ Setup complete!
echo To run the app, execute:
if /i "%use_venv%"=="y" (
    echo call venv\Scripts\activate
)
echo python ytmp3install.py
pause
