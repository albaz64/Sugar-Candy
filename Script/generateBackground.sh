#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

# RANDOM_IMAGE=$(find "$SCRIPT_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) -printf "%P\n" | shuf -n 1)

# ln -sf "$SCRIPT_DIR/$RANDOM_IMAGE" "$SCRIPT_DIR/background.jpg"

# find "$SCRIPT_DIR/../Backgrounds" -type f \( -name "*.jpg" -o -name "*.png" \) -printf "%P\n" >$SCRIPT_DIR/randomImage.js

DATA=$(find "$SCRIPT_DIR/../Backgrounds" -type f \( -name "*.jpg" -o -name "*.png" \) -printf "\"%P\", ")

cat <<EOF >$SCRIPT_DIR/randomImage.js
const data = [$DATA];
let usedIndices = [];

function getRandom() {
    const prefix = 'Backgrounds/';
    if (usedIndices.length === data.length) {
        usedIndices = [];
    }

    let index;
    do {
        index = Math.floor(Math.random() * data.length);
    } while (usedIndices.includes(index));

    usedIndices.push(index);
    return prefix + data[index];
}
EOF
