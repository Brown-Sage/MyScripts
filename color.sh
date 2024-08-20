#!/bin/bash

# Full path to the Firefly-cli executable file
FIREFLY_CLI="/home/aryan/Downloads/Firefly-cli/target/debug/Firefly-cli"

# Function to print colorized and bold text in uppercase(looks cool)
colorize() {
    text=$(echo "$2" | tr '[:lower:]' '[:upper:]')
    case $1 in
        blue)
            echo -e "\033[1;34m$text\033[0m"
            ;;
        yellow)
            echo -e "\033[1;33m$text\033[0m"
            ;;
        green)
            echo -e "\033[1;32m$text\033[0m"
            ;;
        orange)
            echo -e "\033[1;38;5;214m$text\033[0m"
            ;;
        purple)
            echo -e "\033[1;35m$text\033[0m"
            ;;
        white)
            echo -e "\033[1;37m$text\033[0m"
            ;;
        loop)
            echo -e "\033[1;36m$text\033[0m"
            ;;
    esac
}

# Function to set color and display a message ofc
set_color() {
    case $1 in
        blue)
            sudo $FIREFLY_CLI --effect static --ci 4
            echo "Yay! keyboard is now set to $(colorize blue blue)!"
            ;;
        yellow)
            sudo $FIREFLY_CLI --effect static --ci 1
            echo "Yay! keyboard is now set to $(colorize yellow yellow)!"
            ;;
        green)
            sudo $FIREFLY_CLI --effect static --ci 2
            echo "Yay! keyboard is now set to $(colorize green green)!"
            ;;
        orange)
            sudo $FIREFLY_CLI --effect static --ci 3
            echo "Yay! keyboard is now set to $(colorize orange orange)!"
            ;;
        purple)
            sudo $FIREFLY_CLI --effect static --ci 5
            echo "Yay! keyboard is now set to $(colorize purple purple)!"
            ;;
        white)
            sudo $FIREFLY_CLI --effect static --ci 6
            echo "Yay! keyboard is now set to $(colorize white white)!"
            ;;
        loop)
            sudo $FIREFLY_CLI --effect static --ci 7
            echo "Yay! keyboard is now set to $(colorize loop loop) mode!"
            ;;
        *)
            echo "Usage: $0 {blue|yellow|green|orange|purple|white|loop}"
            ;;
    esac
}

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Please specify a color."
    echo "Usage: $0 {blue|yellow|green|orange|purple|white|loop}"
else
    set_color $1
fi

