import os
import yt_dlp
import tkinter as tk
from tkinter import messagebox, filedialog

def download_mp3():
    url = url_entry.get().strip()
    if not url:
        messagebox.showwarning("Missing URL", "Please enter a YouTube URL.")
        return

    output_folder = filedialog.askdirectory(title="Select Download Folder")
    if not output_folder:
        return

    ydl_opts = {
        'format': 'bestaudio/best',
        'outtmpl': os.path.join(output_folder, '%(title)s.%(ext)s'),
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
        'noplaylist': True,
        'quiet': False,
    }

    try:
        status_label.config(text="Downloading...")
        root.update_idletasks()

        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download([url])

        status_label.config(text="Download complete!")
        messagebox.showinfo("Success", "MP3 downloaded successfully!")
    except FileNotFoundError:
        status_label.config(text="FFmpeg not found.")
        messagebox.showerror("Error", "FFmpeg is required but was not found. Please install FFmpeg and ensure it is in your system PATH.")
    except Exception as e:
        status_label.config(text="Download failed.")
        messagebox.showerror("Error", str(e))


# GUI Setup
root = tk.Tk()
root.title("YouTube to MP3 Downloader")
root.geometry("400x200")
root.resizable(False, False)

tk.Label(root, text="YouTube URL:").pack(pady=10)

url_entry = tk.Entry(root, width=50)
url_entry.pack()

download_button = tk.Button(root, text="Download MP3", command=download_mp3)
download_button.pack(pady=20)

status_label = tk.Label(root, text="", fg="green")
status_label.pack()

root.mainloop()
