#!/bin/zsh
set -e

WORKFLOW_NAME="Convert FLAC to M4A.workflow"
SERVICES_DIR="$HOME/Library/Services"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

# Check ffmpeg is available
if ! command -v ffmpeg &>/dev/null && ! [ -f /opt/homebrew/bin/ffmpeg ] && ! [ -f /usr/local/bin/ffmpeg ]; then
    echo "Warning: ffmpeg not found. Install it with: brew install ffmpeg"
fi

mkdir -p "$SERVICES_DIR"
rm -rf "$SERVICES_DIR/$WORKFLOW_NAME"
cp -R "$SRC_DIR/$WORKFLOW_NAME" "$SERVICES_DIR/$WORKFLOW_NAME"

# Re-register services
/System/Library/CoreServices/pbs -update 2>/dev/null || true

# macOS marks new services NSRestricted=1 (hidden) by default; explicitly enable it
defaults write pbs NSServicesStatus -dict-add \
  '"(null) - Convert FLAC to M4A - runWorkflowAsService"' \
  '{enabled_context_menu = 1; enabled_services_menu = 1; presentation_modes = {NSApplication = 0; NSContextMenu = 1;};}'

# Relaunch Finder to pick up the change
killall Finder 2>/dev/null || true

echo "Installed: $SERVICES_DIR/$WORKFLOW_NAME"
echo ""
echo "In Finder: right-click any folder → Services → Convert FLAC to M4A"
