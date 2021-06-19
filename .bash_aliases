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

function pipsafe()
{
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        pip3 "$@"
    else
        echo -e "WARNING: you are not in a virtual environment.\nCreate a virtual environment first:\n\n\tpython3 -m venv\n\nOr use pip instead."
    fi
}

# Miscellaneous
alias grepcmd="history | grep"
alias grepenv="env | grep"
alias cpv="rsync -ah --info=progress2"
