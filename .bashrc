parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\033[0;33m\]docker:\W:\[\033[0;32m\]\[\033[0m\]$ '