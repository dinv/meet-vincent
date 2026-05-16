#!/bin/bash

REPO=~/meet-vincent
DOWNLOADS=~/Downloads

# Grab the most recently modified HTML file from Downloads
LATEST=$(ls -t "$DOWNLOADS"/*.html 2>/dev/null | head -1)

if [ -z "$LATEST" ]; then
  echo "No HTML file found in Downloads."
  exit 1
fi

echo "Found: $LATEST"

# Ask for commit message
read -p "Commit message: " MSG

if [ -z "$MSG" ]; then
  echo "Commit message can't be empty."
  exit 1
fi

# Copy to repo as index.html
cp "$LATEST" "$REPO/index.html"
echo "Copied to $REPO/index.html"

# Push
cd "$REPO"
git add .
git commit -m "$MSG"
git push

echo "Done. Live shortly at https://dinv.github.io/meet-vincent"
