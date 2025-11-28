#!/usr/bin/env bash

# --- Usage check ---
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/image.png /path/to/audio.wav"
    exit 1
fi

IMAGE_SRC="$1"
AUDIO_SRC="$2"

# Check that files exist
if [ ! -f "$IMAGE_SRC" ]; then
    echo "Error: Image file '$IMAGE_SRC' not found!"
    exit 1
fi

if [ ! -f "$AUDIO_SRC" ]; then
    echo "Error: Audio file '$AUDIO_SRC' not found!"
    exit 1
fi

SHARE_DIR="$HOME/.recsll//shared"
mkdir -p "$SHARE_DIR"

# Copy files to share directory
IMAGE_FILE="$SHARE_DIR/$(basename "$IMAGE_SRC")"
AUDIO_FILE="$SHARE_DIR/$(basename "$AUDIO_SRC")"

cp "$IMAGE_SRC" "$IMAGE_FILE"
cp "$AUDIO_SRC" "$AUDIO_FILE"

# Generate HTML
HTML_FILE="$SHARE_DIR/index.html"
cat > "$HTML_FILE" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Super Secret Stuff</title>
</head>
<body>
<h1>Super Secret Stuff</h1>
<img src="$(basename "$IMAGE_FILE")" alt="Super Secret Image" style="max-wid>
<p>
<audio controls>
  <source src="$(basename "$AUDIO_FILE")" type="audio/wav">
  Your browser does not support the audio element.
</audio>
</p>
</body>
</html>
EOF

echo "Updated content: $HTML_FILE"
echo "Image: $IMAGE_FILE"
echo "Audio: $AUDIO_FILE"

