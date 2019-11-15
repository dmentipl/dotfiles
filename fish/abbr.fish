abbr --add chown 'chown -R'
abbr --add chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
abbr --add cp 'cp -i -r'
abbr --add diff colordiff
abbr --add df 'df -H'
abbr --add du 'du -hs'
abbr --add e exit
abbr --add finder 'open -a Finder .'
abbr --add grep 'grep --color=auto --exclude-dir={.git,.hg,.svn}'
abbr --add j 'jobs -l'
abbr --add mkdir 'mkdir -pv'
abbr --add mv 'mv -i'
abbr --add pgrep 'pgrep -a -l'
abbr --add rg 'rg -S'
abbr --add scp 'scp -r'
abbr --add ssh 'ssh -Y'

# Use trash not rm.
if type trash > /dev/null ^/dev/null
    abbr --add bin trash
    abbr --add rm 'printf "%s\n" "Use bin instead, or \\rm for real rm if required."'
else
    abbr --add rm 'rm -R'
end

# List directory contents.
if type exa > /dev/null ^/dev/null
    abbr --add l 'exa -l -h'
    abbr --add ls 'exa -1'
    abbr --add lg 'exa -l -h --git'
    abbr --add ll 'exa -l -h -a'
    abbr --add lm 'exa -l -h -s modified'
    abbr --add lr 'exa -l -h -R'
    abbr --add lt 'exa -l -h -T'
    abbr --add lx 'exa -l -h -s extension'
    abbr --add lz 'exa -l -h -s size'
    abbr --add tree 'exa -T'
else
    if test (uname) = 'Darwin'
        abbr --add ls 'ls -G -1'
    else
        abbr --add ls 'ls --color=tty -1'
    end
    abbr --add l 'ls -lh'
    abbr --add la 'ls -lah'
    abbr --add ll 'ls -lAh'
    abbr --add lx 'ls -lAh -XB'  # Extension
    abbr --add lk 'ls -lAh -Sr'  # File size
    abbr --add lt 'ls -lAh -tur' # Access time
    abbr --add lc 'ls -lAh -tcr' # File change time
    abbr --add lm 'ls -lAh -tr'  # Modification time
end

# Git.
abbr --add ga 'git add'
abbr --add gam 'git add --update'
abbr --add gap 'git add --patch'
abbr --add gc 'git commit --verbose'
abbr --add gcl 'git clean --force'
abbr --add gcm 'git commit --message'
abbr --add gco 'git checkout'
abbr --add gd 'git diff'
abbr --add gds 'git diff --staged'
abbr --add gl 'git pull'
abbr --add glg 'git log --stat --abbrev-commit'
abbr --add glgc 'git-log-compact'
abbr --add glgg 'git log --graph --abbrev-commit'
abbr --add glgo 'git log --oneline --abbrev-commit'
abbr --add glgp 'git log --patch --abbrev-commit'
abbr --add gp 'git push'
abbr --add gsh 'git show'
abbr --add gsp 'git status --porcelain'
abbr --add gst 'git status'

# Tmux.
abbr --add ta 'tmux attach'
abbr --add tl 'tmux list-sessions'
abbr --add tk 'tmux kill-session'
abbr --add tn 'tmux new-session'

# Neovim.
if type nvim > /dev/null ^/dev/null
    abbr --add vim nvim
    abbr --add ex 'nvim -e'
    abbr --add view 'nvim -R'
    abbr --add vimdiff 'nvim -d'
end

# Resize terminal window.
abbr --add tiny "printf '\e[8;45;85t'"
abbr --add small "printf '\e[8;60;100t'"
abbr --add medium "printf '\e[8;60;150t'"
abbr --add large "printf '\e[8;60;200t'"

# macOS or Linux specific.
if test (uname) = 'Darwin'

    # Clipboard copy/paste.
    abbr --add copy 'pbcopy'
    abbr --add paste 'pbpaste'

else

    # Like pbcopy and pbpaste on Linux systems.
    abbr --add copy 'xsel --clipboard --input'
    abbr --add paste 'xsel --clipboard --output'

    # Open app from command line.
    abbr --add open xdg-open

    # Say out loud.
    abbr --add say spd-say

end
