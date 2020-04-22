abbr --add --global chown 'chown -R'
abbr --add --global cp 'cp -i -r'
abbr --add --global diff colordiff
abbr --add --global df 'df -H'
abbr --add --global du 'du -hs'
abbr --add --global e exit
abbr --add --global j 'jobs -l'
abbr --add --global mkdir 'mkdir -pv'
abbr --add --global mv 'mv -i'
abbr --add --global pgrep 'pgrep -a -l'
abbr --add --global rg 'rg -S'
abbr --add --global scp 'scp -r'
abbr --add --global ssh 'ssh -Y'
abbr --add --global ssht 'ssh -N -f -L localhost:8888:localhost:8888'
abbr --add --global which 'which -a'

# Use trash not rm.
if type trash > /dev/null ^/dev/null
    abbr --add --global bin trash
    abbr --add --global rm 'printf "%s\n" "Use bin instead, or \\rm for real rm if required."'
else
    abbr --add --global rm 'rm -R'
end

# List directory contents.
if type exa > /dev/null ^/dev/null
    abbr --add --global l 'exa -l -h'
    abbr --add --global ls 'exa -1'
    abbr --add --global lg 'exa -l -h --git'
    abbr --add --global ll 'exa -l -h -a'
    abbr --add --global lm 'exa -l -h -s modified'
    abbr --add --global lr 'exa -l -h -R'
    abbr --add --global lt 'exa -l -h -T'
    abbr --add --global lx 'exa -l -h -s extension'
    abbr --add --global lz 'exa -l -h -s size'
    abbr --add --global tree 'exa -T'
else
    abbr --add --global ls 'ls -1'
    abbr --add --global l 'ls -lh'
    abbr --add --global la 'ls -lah'
    abbr --add --global ll 'ls -lAh'
    abbr --add --global lx 'ls -lAh -XB'
    abbr --add --global lk 'ls -lAh -Sr'
    abbr --add --global lm 'ls -lAh -tr'
end

# Git.
abbr --add --global ga 'git add'
abbr --add --global gam 'git add --update'
abbr --add --global gap 'git add --patch'
abbr --add --global gc 'git commit --verbose'
abbr --add --global gco 'git checkout'
abbr --add --global gd 'git diff'
abbr --add --global gds 'git diff --staged'
abbr --add --global gl 'git pull'
abbr --add --global glg 'git log --stat --abbrev-commit'
abbr --add --global glgp 'git log --patch --abbrev-commit'
abbr --add --global gp 'git push'
abbr --add --global gsh 'git show'
abbr --add --global gst 'git status'
abbr --add --global gr 'git log -1 --relative-date --stat --abbrev-commit'

# Tmux.
abbr --add --global ta 'tmux attach'
abbr --add --global tl 'tmux list-sessions'
abbr --add --global tk 'tmux kill-session'
abbr --add --global tn 'tmux new-session'

# Neovim.
if type nvim > /dev/null ^/dev/null
    abbr --add --global vim nvim
    abbr --add --global ex 'nvim -e'
    abbr --add --global view 'nvim -R'
    abbr --add --global vimdiff 'nvim -d'
end

# Resize terminal window.
abbr --add --global tiny "printf '\e[8;45;85t'"
abbr --add --global small "printf '\e[8;60;100t'"
abbr --add --global medium "printf '\e[8;60;150t'"
abbr --add --global large "printf '\e[8;60;200t'"

# macOS specific.
if test (uname) = 'Darwin'

    # Clipboard copy/paste.
    abbr --add --global copy 'pbcopy'
    abbr --add --global paste 'pbpaste'

    # macOS applications.
    abbr --add --global chrome \
        '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    abbr --add --global finder 'open -a Finder .'

# Linux specific.
else

    # Like pbcopy and pbpaste on Linux systems.
    abbr --add --global copy 'xsel --clipboard --input'
    abbr --add --global paste 'xsel --clipboard --output'

    # Open app from command line.
    abbr --add --global open xdg-open

    # Say out loud.
    abbr --add --global say spd-say

end
