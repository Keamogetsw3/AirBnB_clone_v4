#!/bin/bash

# Ensure the script is run from the correct directory
if [ ! -d "web_flask" ] || [ ! -d "web_dynamic" ]; then
    echo "Please run this script from the root of the AirBnB_clone_v4 project."
    exit 1
fi

# Paths
SRC_DIR="web_flask"
DEST_DIR="web_dynamic"
SRC_PY_FILE="$SRC_DIR/100-hbnb.py"
DEST_PY_FILE="$DEST_DIR/0-hbnb.py"
SRC_HTML_FILE="$SRC_DIR/templates/100-hbnb.html"
DEST_HTML_FILE="$DEST_DIR/templates/0-hbnb.html"
FALLBACK_HTML_FILE="$SRC_DIR/templates/8-hbnb.html"

# Step 1: Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR/static"
mkdir -p "$DEST_DIR/templates"

# Step 2: Copy static assets
if [ -d "$SRC_DIR/static" ]; then
    cp -r "$SRC_DIR/static/"* "$DEST_DIR/static/"
else
    echo "Static directory not found."
fi

# Step 3: Copy __init__.py
if [ -f "$SRC_DIR/__init__.py" ]; then
    cp "$SRC_DIR/__init__.py" "$DEST_DIR/"
else
    echo "__init__.py not found."
fi

# Step 4: Copy and rename 100-hbnb.py to 0-hbnb.py
if [ -f "$SRC_PY_FILE" ]; then
    cp "$SRC_PY_FILE" "$DEST_PY_FILE"
else
    echo "$SRC_PY_FILE not found."
fi

# Step 5: Copy and rename 100-hbnb.html to 0-hbnb.html
if [ -f "$SRC_HTML_FILE" ]; then
    cp "$SRC_HTML_FILE" "$DEST_HTML_FILE"
elif [ -f "$FALLBACK_HTML_FILE" ]; then
    cp "$FALLBACK_HTML_FILE" "$DEST_HTML_FILE"
else
    echo "Neither $SRC_HTML_FILE nor $FALLBACK_HTML_FILE found."
fi

# Step 6: Update route in 0-hbnb.py
if [ -f "$DEST_PY_FILE" ]; then
    sed -i 's@/100-hbnb/@/0-hbnb/@g' "$DEST_PY_FILE"
else
    echo "$DEST_PY_FILE not found, skipping route update."
fi

# Step 7: Add cache_id to render_template in 0-hbnb.py
if [ -f "$DEST_PY_FILE" ]; then
    sed -i '/render_template(/a \ \ \ \ cache_id=str(uuid.uuid4()),' "$DEST_PY_FILE"
else
    echo "$DEST_PY_FILE not found, skipping cache_id addition."
fi

# Step 8: Update 0-hbnb.html to use cache_id in asset URLs
if [ -f "$DEST_HTML_FILE" ]; then
    sed -i 's@href="@href="{{ url_for('"@ "$DEST_HTML_FILE"
    sed -i 's@src="@src="{{ url_for('"@ "$DEST_HTML_FILE"
    sed -i 's@.css@.css?v={{ cache_id }}"@g' "$DEST_HTML_FILE"
    sed -i 's@.js@.js?v={{ cache_id }}"@g' "$DEST_HTML_FILE"
else
    echo "$DEST_HTML_FILE not found, skipping asset URL update."
fi
