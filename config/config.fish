# ============================================================================ #
# ==== CONFIGURATION ==== #

set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/bin $PATH

test -e ~/conda/bin/conda && eval ~/conda/bin/conda "shell.fish" "hook" $argv | source
function fish_right_prompt; end

command -v starship > /dev/null && starship init fish | source

test -e ~/.config/fish/local.fish && source ~/.config/fish/local.fish

# ============================================================================ #
# ==== ABBREVIATIONS ==== #

abbr --add --global chown 'chown -R'
abbr --add --global cp 'cp -i -r'
abbr --add --global df 'df -H'
abbr --add --global du 'du -chs'
abbr --add --global e exit
abbr --add --global j 'jobs -l'
abbr --add --global mkdir 'mkdir -pv'
abbr --add --global mv 'mv -i'
abbr --add --global path 'echo $PATH | tr " " "\n"'
abbr --add --global pgrep 'pgrep -a -l'
command -v rg > /dev/null && abbr --add --global rg 'rg -S'
abbr --add --global scp 'scp -r'
abbr --add --global ssh 'ssh -Y'
abbr --add --global which 'which -a'

if command -v trash > /dev/null
  abbr --add --global bin trash
  abbr --add --global rm 'printf "%s\n" "Use bin instead, or \\rm for real rm if required."'
else
  abbr --add --global rm 'rm -R'
end

if command -v exa > /dev/null
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

if command -v git > /dev/null
  abbr --add --global ga 'git add'
  abbr --add --global gam 'git add --update'
  abbr --add --global gap 'git add --patch'
  abbr --add --global gb 'git branch'
  abbr --add --global gbl 'git branch --verbose --list'
  abbr --add --global gbr 'git branch --verbose --remotes'
  abbr --add --global go 'git checkout'
  abbr --add --global gn 'git clone'
  abbr --add --global gc 'git commit --verbose'
  abbr --add --global gd 'git diff'
  abbr --add --global gds 'git diff --staged'
  abbr --add --global gf 'git fetch --all --prune'
  abbr --add --global gg 'git log --stat --abbrev-commit'
  abbr --add --global ggo 'git log --graph --pretty=format:"%C(red)%h%C(reset) %C(yellow)%d%C(reset) %s %C(green)(%cr)%C(reset) %C(blue)<%an>%C(reset)" --abbrev-commit'
  abbr --add --global ggp 'git log --patch --abbrev-commit'
  abbr --add --global gm 'git merge'
  abbr --add --global gl 'git pull'
  abbr --add --global gp 'git push'
  abbr --add --global gr 'git rebase'
  abbr --add --global gu 'git remote --verbose'
  abbr --add --global gua 'git remote --verbose add'
  abbr --add --global gx 'git reset --soft HEAD^'
  abbr --add --global gt 'git stash --include-untracked'
  abbr --add --global gs 'git status'
end

if command -v tmux > /dev/null
  abbr --add --global ta 'tmux attach'
  abbr --add --global tc 'tmux choose-tree -s'
  abbr --add --global td 'tmux detach'
  abbr --add --global tl 'tmux list-sessions'
  abbr --add --global tk 'tmux kill-session'
  abbr --add --global tn 'tmux new-session'
  abbr --add --global ts 'tmux switch-client'
end

if command -v nvim > /dev/null
  abbr --add --global vim nvim
  abbr --add --global ex 'nvim -e'
  abbr --add --global view 'nvim -R'
  abbr --add --global vimdiff 'nvim -d'
end

if command -v pbcopy > /dev/null
  abbr --add --global copy 'pbcopy'
  abbr --add --global paste 'pbpaste'
else if command -v xsel > /dev/null
  abbr --add --global copy 'xsel --clipboard --input'
  abbr --add --global paste 'xsel --clipboard --output'
end

command -v xdg-open > /dev/null && abbr --add --global open xdg-open
