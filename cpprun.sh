#!/bin/zsh

# Find the most recently modified .cpp file
latest_file=$(ls -t *.cpp | head -n1)

if [ -z "$latest_file" ]; then
    echo "No .cpp files found in the current directory."
    exit 1
fi

echo "Compiling $latest_file..."

# Get the executable name by removing the .cpp extension
executable="${latest_file%.cpp}"

# Compile the file
g++ -o "$executable" "$latest_file"

if [ $? -eq 0 ]; then
    echo "Compilation successful. Executable created: $executable"
    echo "Running the application..."
    ./"$executable"
else
    echo "Compilation failed."
fi
# yayyyy
