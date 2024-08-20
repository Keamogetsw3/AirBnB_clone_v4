#!/bin/bash

# Paths
SRC_DIR="web_flask"
DEST_DIR="web_dynamic"
SRC_PY_FILE="$SRC_DIR/100-hbnb.py"
DEST_PY_FILE="$DEST_DIR/0-hbnb.py"
SRC_HTML_FILE="$SRC_DIR/templates/100-hbnb.html"
DEST_HTML_FILE="$DEST_DIR/templates/0-hbnb.html"
FALLBACK_HTML_FILE="$SRC_DIR/templates/8-hbnb.html"

# Step 1: Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"
mkdir -p "$DEST_DIR/static"
mkdir -p "$DEST_DIR/templates"

# Step 2: Copy static assets
cp -r "$SRC_DIR/static/"* "$DEST_DIR/static/"

# Step 3: Copy __init__.py
cp "$SRC_DIR/__init__.py" "$DEST_DIR/"

# Step 4: Copy and rename 100-hbnb.py to 0-hbnb.py
cp "$SRC_PY_FILE" "$DEST_PY_FILE"

# Step 5: Copy and rename 100-hbnb.html to 0-hbnb.html
if [ -f "$SRC_HTML_FILE" ]; then
    cp "$SRC_HTML_FILE" "$DEST_HTML_FILE"
else
    cp "$FALLBACK_HTML_FILE" "$DEST_HTML_FILE"
fi

# Step 6: Update route in 0-hbnb.py
sed -i 's@/100-hbnb/@/0-hbnb/@g' "$DEST_PY_FILE"

# Step 7: Add cache_id to render_template in 0-hbnb.py
sed -i '/render_template(/a \ \ \ \ cache_id=str(uuid.uuid4()),' "$DEST_PY_FILE"

# Step 8: Update 0-hbnb.html to use cache_id in asset URLs
sed -i 's@href="@href="{{ url_for('"@ "$DEST_HTML_FILE"
sed -i 's@src="@src="{{ url_for('"@ "$DEST_HTML_FILE"
sed -i 's@.css@.css?v={{ cache_id }}"@g' "$DEST_HTML_FILE"
sed -i 's@.js@.js?v={{ cache_id }}"@g' "$DEST_HTML_FILE"
