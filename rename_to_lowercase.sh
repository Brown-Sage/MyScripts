#!/bin/bash
# read the code before running 
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

echo "WARNING: This script will rename all files and folders (including those in subdirectories) to lowercase."
echo "This action cannot be easily undone. Make sure you have a backup before proceeding."
echo "Current working directory: $(pwd)"
echo ""
read -p "Are you sure you want to continue? (y/N): " confirm

if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then

# Start the renaming process from the current directory
rename_to_lowercase "$(pwd)"
    echo "Renaming complete."
else
    echo "Operation cancelled."
fi
