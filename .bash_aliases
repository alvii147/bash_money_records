#!/usr/bin/bash
# Bash Aliases & Functions

# Function to demonstrate command usage
usage() {
    echo -e "\e[1;33mUsage:\e[m"
    echo -e "\e[1;35m\t$1\e[m"
    echo -e "\e[1;33m\nWhat it executes:\e[m"
    echo -e "\e[1;35m\t$2\e[m"
}

# Python
alias python="python3"
alias py="python3"
alias pip="pip3"

# Miscellaneous
alias grepcmd="history | grep"
alias grepenv="env | grep"
alias cpv="rsync -ah --info=progress2"
