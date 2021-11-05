# ============================================================================ #
# ==== CONFIGURATION ==== #

# Bind ctrl-space
bind -k nul accept-autosuggestion

# Initialize starship prompt
command -q starship && starship init fish | source

# Initialize zoxide
command -q zoxide && zoxide init fish | source

# Load local fish config
test -e ~/.config/fish/local.fish && source ~/.config/fish/local.fish

# ============================================================================ #
# ==== ABBREVIATIONS ==== #

abbr --add --global chown 'chown -R'
abbr --add --global cp 'cp -i -r'
abbr --add --global df 'df -H'
abbr --add --global du 'du -chs'
abbr --add --global mkdir 'mkdir -pv'
abbr --add --global mv 'mv -i'
abbr --add --global path 'for path in $PATH; echo $path; end'
command -q rg && abbr --add --global rg 'rg -S'
abbr --add --global scp 'scp -r'
abbr --add --global ssh 'ssh -Y'
abbr --add --global which 'which -a'

if command -q trash
  abbr --add --global bin 'trash'
  abbr --add --global rm '# Use trash instead, or /bin/rm if required'
end

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

if command -q tmux
  abbr --add --global ta 'tmux attach'
  abbr --add --global tc 'tmux choose-tree -s'
  abbr --add --global td 'tmux detach'
  abbr --add --global tl 'tmux list-sessions'
  abbr --add --global tk 'tmux kill-session'
  abbr --add --global tn 'tmux new-session'
  abbr --add --global ts 'tmux switch-client'
end

command -q nvim && abbr --add --global vim nvim

if command -q pbcopy
  abbr --add --global copy 'pbcopy'
  abbr --add --global paste 'pbpaste'
else if command -q xsel
  abbr --add --global copy 'xsel --clipboard --input'
  abbr --add --global paste 'xsel --clipboard --output'
end

command -q xdg-open && abbr --add --global open xdg-open
