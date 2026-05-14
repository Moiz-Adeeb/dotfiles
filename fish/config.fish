# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end
#
# --- Startup ---
# Fastfetch (your custom command)
fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Terminal:Memory:Swap --logo ~/.config/fastfetch/logos/moiz.txt

# --- Environment Variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx FCEDIT nvim
set -gx TERMINAL alacritty
set -gx BROWSER brave-browser

if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx PAGER bat
end

# FZF Colors (Translated from your Zsh config)
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --info=inline-right --ansi --layout=reverse --border=rounded \
  --color=border:#27a1b9,fg:#c0caf5,gutter:#16161e,header:#ff9e64 \
  --color=hl+:#2ac3de,hl:#2ac3de,info:#545c7e,marker:#ff007c \
  --color=pointer:#ff007c,prompt:#2ac3de,query:#c0caf5:regular \
  --color=scrollbar:#27a1b9,separator:#ff9e64,spinner:#ff007c"

# --- Path Management ---
fish_add_path ~/bin ~/sbin ~/.local/bin ~/.bin ~/.cargo/bin ~/.config/tmux/plugins/tmuxifier/bin

# --- Aliases & Abbreviations ---
alias c='clear'
alias q='exit'
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias lg='lazygit'

if type -q lsd
    alias ls='lsd -F --group-dirs first'
    alias ll='lsd --all --header --long --group-dirs first'
    alias tree='lsd --tree'
end

if type -q nvim
    alias vi='nvim'
    alias vim='nvim'
end

# --- Functions ---
# Yazi wrapper
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")








# --- Startup ---
# Fastfetch (your custom command)
fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Terminal:Memory:Swap --logo ~/.config/fastfetch/logos/moiz.txt

# --- Environment Variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx FCEDIT nvim
set -gx TERMINAL footclient
set -gx BROWSER brave-browser

if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx PAGER bat
end

# FZF Colors (Translated from your Zsh config)
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --info=inline-right --ansi --layout=reverse --border=rounded \
  --color=border:#27a1b9,fg:#c0caf5,gutter:#16161e,header:#ff9e64 \
  --color=hl+:#2ac3de,hl:#2ac3de,info:#545c7e,marker:#ff007c \
  --color=pointer:#ff007c,prompt:#2ac3de,query:#c0caf5:regular \
  --color=scrollbar:#27a1b9,separator:#ff9e64,spinner:#ff007c"

# --- Path Management ---
fish_add_path ~/bin ~/sbin ~/.local/bin ~/.bin ~/.cargo/bin ~/.config/tmux/plugins/tmuxifier/bin

# --- Aliases & Abbreviations ---
alias c='clear'
alias q='exit'
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

if type -q lsd
    alias ls='lsd -F --group-dirs first'
    alias ll='lsd --all --header --long --group-dirs first'
    alias tree='lsd --tree'
end

if type -q nvim
    alias vi='nvim'
    alias vim='nvim'
end

# --- Functions ---
# Yazi wrapper
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end








# --- Startup ---
# Fastfetch (your custom command)
fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Terminal:Memory:Swap --logo ~/.config/fastfetch/logos/moiz.txt

# --- Environment Variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx FCEDIT nvim
set -gx TERMINAL footclient
set -gx BROWSER brave-browser

if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx PAGER bat
end

# FZF Colors (Translated from your Zsh config)
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --info=inline-right --ansi --layout=reverse --border=rounded \
  --color=border:#27a1b9,fg:#c0caf5,gutter:#16161e,header:#ff9e64 \
  --color=hl+:#2ac3de,hl:#2ac3de,info:#545c7e,marker:#ff007c \
  --color=pointer:#ff007c,prompt:#2ac3de,query:#c0caf5:regular \
  --color=scrollbar:#27a1b9,separator:#ff9e64,spinner:#ff007c"

# --- Path Management ---
fish_add_path ~/bin ~/sbin ~/.local/bin ~/.bin ~/.cargo/bin ~/.config/tmux/plugins/tmuxifier/bin

# --- Aliases & Abbreviations ---
alias c='clear'
alias q='exit'
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

if type -q lsd
    alias ls='lsd -F --group-dirs first'
    alias ll='lsd --all --header --long --group-dirs first'
    alias tree='lsd --tree'
end

if type -q nvim
    alias vi='nvim'
    alias vim='nvim'
end

# --- Functions ---
# Yazi wrapper
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# --- VI Mode ---
fish_vi_key_bindings
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block
	rm -f -- "$tmp"
end

# --- VI Mode ---
fish_vi_key_bindings
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# --- VI Mode ---
fish_vi_key_bindings
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

