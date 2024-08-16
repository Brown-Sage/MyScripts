#!/bin/bash

rename_to_lowercase() {
    local path="$1"
    for item in "$path"/*; do
        if [[ -e "$item" ]]; then
            local dir=$(dirname "$item")
            local name=$(basename "$item")
            local lowercase_name=$(echo "$name" | tr '[:upper:]' '[:lower:]')
            
            if [[ "$name" != "$lowercase_name" ]]; then
                mv "$item" "$dir/$lowercase_name"
                echo "Renamed: $item -> $dir/$lowercase_name"
            fi
            
            if [[ -d "$dir/$lowercase_name" ]]; then
                rename_to_lowercase "$dir/$lowercase_name"
            fi
        fi
    done
}

# Start the renaming process from the current directory
rename_to_lowercase "$(pwd)"

echo "Renaming complete."
