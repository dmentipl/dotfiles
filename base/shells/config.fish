# ============================================================================ #
# ==== CONFIGURATION ==== #

# Bind ctrl-space
bind -k nul accept-autosuggestion

# Initialize direnv
command -q direnv && direnv hook fish | source

# Initialize starship
command -q starship && starship init fish | source

# Initialize zoxide
command -q zoxide && zoxide init fish | source

# ============================================================================ #
# ==== DEVELOPMENT ==== #

# Initialize conda
command -q conda && eval conda "shell.fish" "hook" $argv | source

# Initialize pyenv
command -q pyenv && pyenv init - | source

# Initialize rbenv
command -q rbenv && rbenv init - fish | source

# ============================================================================ #
# ==== ABBREVIATIONS ==== #

abbr --add --global chown 'chown -R'
abbr --add --global cp 'cp -i -r'
abbr --add --global df 'df -H'
abbr --add --global du 'du -chs'
abbr --add --global mkdir 'mkdir -pv'
abbr --add --global mv 'mv -i'
abbr --add --global path 'for path in $PATH; echo $path; end'
abbr --add --global scp 'scp -r'
abbr --add --global ssh 'ssh -Y'
abbr --add --global which 'which -a'

command -q code && abbr --add --global c code
command -q code && abbr --add --global c. 'code .'
command -q just && abbr --add --global j just
command -q nvim && abbr --add --global vim nvim
command -q rg && abbr --add --global rg 'rg -S'
command -q xdg-open && abbr --add --global open xdg-open

if command -q exa
  abbr --add --global l 'exa -l'
  abbr --add --global ls 'exa -1'
  abbr --add --global lg 'exa -l --git'
  abbr --add --global ll 'exa -l -a'
  abbr --add --global lm 'exa -l -s modified'
  abbr --add --global lr 'exa -l -R'
  abbr --add --global lt 'exa -T'
  abbr --add --global lx 'exa -l -s extension'
  abbr --add --global lz 'exa -l -s size'
end

if command -q git
  set prettyformat "%C(red)%h%C(reset) %C(yellow)%d%C(reset) %s %C(green)(%cr)%C(reset) %C(blue)<%an>%C(reset)"
  abbr --add --global diff 'git diff --no-index'
  abbr --add --global ga 'git add'
  abbr --add --global gam 'git add --update'
  abbr --add --global gap 'git add --patch'
  abbr --add --global gb 'git branch --all --list --verbose'
  abbr --add --global gbd 'git branch -D'
  abbr --add --global go 'git checkout'
  abbr --add --global gob 'git checkout -b'
  abbr --add --global gn 'git clone'
  abbr --add --global gc 'git commit --verbose'
  abbr --add --global gcm 'git commit --message'
  abbr --add --global gd 'git diff'
  abbr --add --global gdc 'git diff --compact-summary'
  abbr --add --global gds 'git diff --staged'
  abbr --add --global gdt 'git difftool --no-prompt'
  abbr --add --global gdw 'git diff --word-diff'
  abbr --add --global gf 'git fetch --all --prune'
  abbr --add --global gg 'git log --abbrev-commit --stat'
  abbr --add --global ggo 'git log --abbrev-commit --graph --pretty=format:$prettyformat'
  abbr --add --global ggp 'git log --abbrev-commit --patch'
  abbr --add --global gm 'git merge'
  abbr --add --global gmt 'git mergetool'
  abbr --add --global gl 'git pull'
  abbr --add --global gp 'git push'
  abbr --add --global gr 'git rebase'
  abbr --add --global gu 'git remote --verbose'
  abbr --add --global gx 'git reset --soft HEAD^'
  abbr --add --global gt 'git stash --include-untracked'
  abbr --add --global gs 'git status'
  abbr --add --global gw 'git show --abbrev-commit --stat'
end

if command -q tmux
  abbr --add --global ta 'tmux attach'
  abbr --add --global tc 'tmux choose-tree -s'
  abbr --add --global td 'tmux detach'
  abbr --add --global tl 'tmux list-sessions'
  abbr --add --global tk 'tmux kill-session'
  abbr --add --global tn 'tmux new-session'
  abbr --add --global ts 'tmux switch-client'
end

if command -q trash
  abbr --add --global bin 'trash'
  abbr --add --global rm '# Use trash instead, or /bin/rm if required'
end

if command -q pbcopy
  abbr --add --global copy 'pbcopy'
  abbr --add --global paste 'pbpaste'
else if command -q xsel
  abbr --add --global copy 'xsel --clipboard --input'
  abbr --add --global paste 'xsel --clipboard --output'
end
