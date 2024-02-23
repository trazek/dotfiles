alias lc='clear;ls -la'
alias p='nano'
alias workspace='cd /Users/andrew.ferguson/workspace'
alias documents='cd /Users/andrew.ferguson/Documents'
alias myip='ifconfig | grep inet'
alias githubsso='echo https://github.com/enterprises/ukg/sso | pbcopy'
alias ignite='echo https://github.com/UKGEPIC/dls-ignite | pbcopy'
alias wayfinding='echo https://github.com/UKGEPIC/wayfinding-workspace | pbcopy'

alias r='npm run'
alias i='npm i'
alias ci='npm ci'

function cd() {
    builtin cd $1;
    clear;
    ls -la;
}

function gitpush() {
    branch="$(git branch | grep \* | cut -d ' ' -f2)"
    git push origin $branch -f --no-verify
}

#Display git information in zshell prompt
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

export EDITOR=nano
COLOR_DEF=$'\e[0m'
COLOR_USR=$'\e[38;5;243m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

#nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#Quark
export PATH=$PATH:/usr/local/lib/@quark/cli/bin

#Local bin
export PATH=$PATH:/usr/local/bin

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

