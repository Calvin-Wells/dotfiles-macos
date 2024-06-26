#Git Integration
autoload -Uz compinit && compinit

#Git prompt from example
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

#Bold, green, username, no colour, :, blue, directory, no colour, new line, >, no bold
PROMPT="%B%F{green}%n%f:%F{blue}%~%f "'${vcs_info_msg_0_}'$'\n'"%#%b "

#Set the git prompt to be branch name in cyan
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%f'
zstyle ':vcs_info:*' enable git

# Use exa instead of ls
alias ls="exa"

# Use neovim instead of vim and vi
alias vim="nvim"
alias vi="nvim"
alias :q="exit"

#Use zoxide
eval "$(zoxide init --cmd cd zsh)"

# Add node to the path
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

#fzf things
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules,.git,Library}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fvim='vim $(fzf --preview "bat --style numbers,changes --color=always {} | head -500")'

# enable syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
