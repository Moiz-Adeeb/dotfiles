# --- Environment Variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx FCEDIT nvim
set -gx TERMINAL alacritty
set -gx BROWSER zen-browser

if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx PAGER bat
end

# FZF Colors
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --info=inline-right --ansi --layout=reverse --border=rounded \
  --color=border:#27a1b9,fg:#c0caf5,gutter:#16161e,header:#ff9e64 \
  --color=hl+:#2ac3de,hl:#2ac3de,info:#545c7e,marker:#ff007c \
  --color=pointer:#ff007c,prompt:#2ac3de,query:#c0caf5:regular \
  --color=scrollbar:#27a1b9,separator:#ff9e64,spinner:#ff007c"

# --- Path Management ---
fish_add_path ~/bin ~/sbin ~/.local/bin ~/.bin ~/.cargo/bin ~/.config/tmux/plugins/tmuxifier/bin ~/.dotnet/tools ~/.npm-global/bin

# --- Abbreviations (Optimized Speed) ---
abbr -a c clear
abbr -a q exit
abbr -a t tmux
abbr -a tx 'tmux kill-server'
abbr -a .. 'cd ..'
abbr -a mkdir 'mkdir -pv'
abbr -a cp 'cp -iv'
abbr -a mv 'mv -iv'
abbr -a rm 'rm -iv'
abbr -a lg lazygit
abbr -a dwl "uwsm app -- dwl -s 'sh ~/.config/dwl/autostart.sh <&-'"


if type -q lsd
    abbr -a ls 'lsd -F --group-dirs first'
    abbr -a ll 'lsd --all --header --long --group-dirs first'
    abbr -a tree 'lsd --tree'
end

if type -q nvim
    abbr -a vi nvim
    #    abbr -a vim nvim
end

# --- VI Mode (Cleaned & Grouped) ---
fish_vi_key_bindings
set fish_cursor_default     block
set fish_cursor_insert      line
set fish_cursor_replace_one underscore
set fish_cursor_visual      block

# # if status is-interactive
# #     # Commands to run in interactive sessions can go here
# #      end
# #
# # --- Startup ---
# # Fastfetch (your custom command)
# #fastfetch --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Terminal:Memory:Swap --logo ~/.config/fastfetch/logos/moiz.txt
#
# starship init fish | source
