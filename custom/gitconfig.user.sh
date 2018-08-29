#!/bin/bash

FILE="$HOME/.bashrc.d/gitconfig.user.sh"

if [ -f "$FILE" ]; then
    exit
fi

read -rp "gitconfig: enter user name: " name
read -rp "gitconfig: enter user email: " email

cat > "$FILE" <<EOF
#!/bin/bash

export GIT_AUTHOR_NAME="$name"
export GIT_AUTHOR_EMAIL="$email"

export EMAIL=\$GIT_AUTHOR_EMAIL
EOF
