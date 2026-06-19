# Convert FLAC to M4A — macOS Finder Quick Action

A macOS Quick Action that adds a right-click menu item in Finder to batch-convert all FLAC files in a folder to M4A (AAC 320kbps) using `ffmpeg`.

## How it works

Right-click any folder in Finder → **Services → Convert FLAC to M4A**

Every `.flac` file in that folder is converted to `.m4a` (AAC 320k). The original files are left untouched. A notification pops up when the conversion is complete.

## Requirements

- macOS 12 Monterey or later
- [ffmpeg](https://ffmpeg.org/) installed via Homebrew:

```bash
brew install ffmpeg
```

## Installation

**Option 1 — Install script (recommended)**

```bash
git clone https://github.com/gschaefer3/finder-flac-converter.git
cd finder-flac-converter
./install.sh
```

**Option 2 — Manual**

Double-click `Convert FLAC to M4A.workflow` in Finder. macOS will prompt you to install it.

---

After installing, the item appears under **right-click → Services** (or **right-click → Quick Actions** depending on your macOS version). If it doesn't appear immediately, log out and back in to let macOS re-register the service.

## Enabling the menu item

If the item is installed but not visible in the right-click menu:

1. Open **System Settings → Privacy & Security → Extensions → Finder Extensions**
2. Make sure **Convert FLAC to M4A** is checked

You can also manage it under **System Settings → Keyboard → Keyboard Shortcuts → Services**.

## Uninstall

```bash
rm -rf ~/Library/Services/"Convert FLAC to M4A.workflow"
```

## License

MIT
