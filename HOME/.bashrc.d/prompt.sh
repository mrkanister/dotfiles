get_git_info() {
    local toplevel=$(git rev-parse --show-toplevel 2> /dev/null)

    if [[ -z $toplevel ]]; then
        return
    fi

    local project=${toplevel##*/}
    local branch=$(git symbolic-ref --short HEAD)

    echo " (git:$project/$branch)"
}

get_prompt() {
    # http://www.termsys.demon.co.uk/vtansi.htm
    local COLOR_DEFAULT="\[\e[0m\]"
    local COLOR_RED="\[\e[1;31m\]"
    local COLOR_GREEN="\[\e[1;32m\]"
    local COLOR_YELLOW="\[\e[1;33m\]"

    local PS1_CHROOT="${debian_chroot:+($debian_chroot)}"
    local PS1_USER="${COLOR_RED}\u@\h${COLOR_DEFAULT}"
    local PS1_PWD="${COLOR_YELLOW}\w${COLOR_DEFAULT}"
    local PS1_GIT="${COLOR_GREEN}\$(get_git_info)${COLOR_DEFAULT}"

    # "[(chroot)]<user>@<host>:<path>[ (git:project/branch)]$ "
    echo "${PS1_CHROOT}${PS1_USER} ${PS1_PWD}${PS1_GIT} \$ "
}

export PS1="$(get_prompt)"
unset -f get_prompt
