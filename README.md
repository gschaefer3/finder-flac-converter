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

```bash
git clone https://github.com/gschaefer3/finder-flac-converter.git
cd finder-flac-converter
./install.sh
```

The script:
1. Copies the workflow to `~/Library/Services/`
2. Explicitly enables it in macOS (see note below)
3. Relaunches Finder so the menu item appears immediately

After installing, right-click any folder in Finder and look under **Services → Convert FLAC to M4A**.

> **Manual install:** You can also double-click `Convert FLAC to M4A.workflow` in Finder, but you will still need to enable it manually in System Settings (see Troubleshooting below).

## Troubleshooting

### The menu item doesn't appear

macOS silently marks all newly installed third-party services as restricted (hidden) by default — this is intentional Apple behavior to prevent the Services menu from getting cluttered. The `install.sh` script handles this automatically, but if you installed manually, enable it yourself:

**Option A — System Settings:**

1. Open **System Settings → Keyboard → Keyboard Shortcuts → Services**
2. Find **Convert FLAC to M4A** under Files and Folders and check the box

**Option B — Terminal:**

```bash
defaults write pbs NSServicesStatus -dict-add \
  '"(null) - Convert FLAC to M4A - runWorkflowAsService"' \
  '{enabled_context_menu = 1; enabled_services_menu = 1; presentation_modes = {NSApplication = 0; NSContextMenu = 1;};}'
killall Finder
```

### ffmpeg not found

Automator doesn't inherit your shell's PATH. The workflow explicitly adds `/opt/homebrew/bin` and `/usr/local/bin`, which covers standard Homebrew install locations. If ffmpeg is installed elsewhere, install it via Homebrew:

```bash
brew install ffmpeg
```

## Uninstall

```bash
rm -rf ~/Library/Services/"Convert FLAC to M4A.workflow"
killall Finder
```

## License

MIT
