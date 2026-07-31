# ZSH Theme - based on bira.zsh-theme (pure zsh; ghostty-compatible)

autoload -Uz colors && colors
setopt PROMPT_SUBST

typeset -g USER_SYMBOL='$'
(( EUID == 0 )) && typeset -g USER_SYMBOL='#'

function _git_prompt() {
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    local branch state
    branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null \
        || command git rev-parse --short HEAD 2>/dev/null) || return

    if [[ -n $(command git status --porcelain --ignore-submodules=dirty 2>/dev/null) ]]; then
        state=' %F{red}✗%f'
    else
        state=' %F{green}✔%f'
    fi

    print -r -- "%F{blue}(${branch}${state}%F{blue})%f "
}

typeset -g PROMPT='%B%F{yellow}%~%f%b $(_git_prompt)%B'
PROMPT+="${USER_SYMBOL}"
PROMPT+='%b '
