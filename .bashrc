# -------------------- COMMAND PROMPT --------------------

# colors for command prompt
COMMAND_PROMPT_DATETIME_COLOR=RANDOMCOLORFUL
COMMAND_PROMPT_USERNAME_HOSTNAME_COLOR=RANDOMCOLORFUL
COMMAND_PROMPT_WORKDIR_COLOR=RANDOMCOLORFUL
COMMAND_PROMPT_GIT_BRANCH_COLOR=RANDOMCOLORFUL

# prefix and suffix for command prompt colors
COMMAND_PROMPT_COLOR_PREFIX_START="\[\e[0;"
COMMAND_PROMPT_COLOR_PREFIX_END="m\]"
COMMAND_PROMPT_COLOR_SUFFIX="\[\e[00m\]"

# convert color codes
DECODE_COMMAND_PROMPT_COLOR() {
    local -n COLOR=$1
    case "$COLOR" in
        BLACK) COLOR=30;;
        RED) COLOR=31;;
        GREEN) COLOR=32;;
        YELLOW) COLOR=33;;
        BLUE) COLOR=34;;
        PINK) COLOR=35;;
        CYAN) COLOR=36;;
        GRAY) COLOR=37;;
        WHITE) COLOR=38;;
        RANDOM) COLOR=$[($RANDOM % 10) + 30];;
        RANDOMCOLORFUL) COLOR=$[($RANDOM % 6) + 31];;
        *) COLOR=39;;
    esac
}

DECODE_COMMAND_PROMPT_COLOR COMMAND_PROMPT_DATETIME_COLOR
DECODE_COMMAND_PROMPT_COLOR COMMAND_PROMPT_USERNAME_HOSTNAME_COLOR
DECODE_COMMAND_PROMPT_COLOR COMMAND_PROMPT_WORKDIR_COLOR
DECODE_COMMAND_PROMPT_COLOR COMMAND_PROMPT_GIT_BRANCH_COLOR

PARSE_GIT_BRANCH() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set up command prompt
export PS1="${COMMAND_PROMPT_COLOR_PREFIX_START}${COMMAND_PROMPT_DATETIME_COLOR}${COMMAND_PROMPT_COLOR_PREFIX_END}[\d \@]${COMMAND_PROMPT_COLOR_SUFFIX} ${COMMAND_PROMPT_COLOR_PREFIX_START}${COMMAND_PROMPT_USERNAME_HOSTNAME_COLOR}${COMMAND_PROMPT_COLOR_PREFIX_END}\u@\h${PROMPT_COLOR_SUFFIX}:${COMMAND_PROMPT_COLOR_SUFFIX} ${COMMAND_PROMPT_COLOR_PREFIX_START}${COMMAND_PROMPT_WORKDIR_COLOR}${COMMAND_PROMPT_COLOR_PREFIX_END}\w${COMMAND_PROMPT_COLOR_SUFFIX} ${COMMAND_PROMPT_COLOR_PREFIX_START}${COMMAND_PROMPT_GIT_BRANCH_COLOR}${COMMAND_PROMPT_COLOR_PREFIX_END}\$(PARSE_GIT_BRANCH)${COMMAND_PROMPT_COLOR_SUFFIX}\n\$ "

# -------------------- GREP --------------------

# search in command history
alias grepcmd="history | grep"
# search in environment variables
alias grepenv="env | grep"
# search in python files
alias greppy="grep -rn --include=*.py --exclude=*/.venv/*"
# search in go files
alias grepgo="grep -rn --include=*.go --exclude={*_test.go,*/vendor/*}"
# search in go test files
alias grepgotest="grep -rn --include=*_test.go --exclude=*/vendor/*"
# search typescript files
alias grepts="grep -rn --include={*.ts,*.tsx} --exclude={*.test.ts,*.test.tsx,*/node_modules/*}"
# search typescript test files
alias greptstest="grep -rn --include={*.test.ts,*.test.tsx} --exclude=*/node_modules/*"

# -------------------- PYTHON --------------------

# configure poetry env creation in project
export POETRY_VIRTUALENVS_IN_PROJECT="true"
# set python to use python3
alias python="python3"
# set pip to use pip3
alias pip="pip3"

# -------------------- DOCKER --------------------

# docker stop everything
alias dockerstop="docker stop \$(docker ps -aq)"
# docker stop and delete everything
alias dockerpurge="docker stop \$(docker ps -aq); docker rm \$(docker ps -aq); docker rmi \$(docker images -aq)"

# -------------------- GITHUB --------------------

# clone from personal github
# sets username and email for repository and disables GPG signing
GITHUB_USERNAME="<username>"
GITHUB_EMAIL="<email>"
githubclone() {
    git clone $1 \
    && cd `basename "$_" .git` \
    && git config user.name $GITHUB_USERNAME \
    && git config user.email $GITHUB_EMAIL \
    && git config commit.gpgsign false \
    && cd -
}

# -------------------- MYSQL --------------------

export MYSQL_USERNAME="<username>"
export MYSQL_PASSWORD="<password>"
export MYSQL_HOSTNAME="<host>"
export MYSQL_PORT="<port>"
# launch mysql shell with authentication
alias mysqlauth="mysql --user=${MYSQL_USERNAME} --password=${MYSQL_PASSWORD}"

# -------------------- POSTGRESQL --------------------

export POSTGRESQL_USERNAME="<username>"
export POSTGRESQL_PASSWORD="<password>"
export POSTGRESQL_HOSTNAME="<host>"
export POSTGRESQL_PORT="<port>"
# launch postgresql shell with authentication
alias psqlauth="PGPASSWORD=${POSTGRESQL_PASSWORD} psql --username=${POSTGRESQL_USERNAME}"

# -------------------- REDIS --------------------

export REDIS_USERNAME="<username>"
export REDIS_PASSWORD="<password>"
export REDIS_HOSTNAME="<host>"
export REDIS_PORT="<port>"
# launch redis shell with authentication
alias redisauth="redis-cli -u redis://${REDIS_USERNAME}:${REDIS_PASSWORD}@${REDIS_HOSTNAME}:${REDIS_PORT}"
