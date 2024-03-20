
alias sudo doas
alias sudoedit "doas rnano"
alias emsdk_setup ". /home/robin/aur/emsdk/emsdk_env.fish"

set -gx GBDKDIR ~/aur/gbdk
set -gx SDCCDIR ~/aur/sdcc

fish_add_path ~/opt/cross/bin
fish_add_path ~/bin
fish_add_path ~/go/bin
fish_add_path ~/aur/zig/zigup/scratch/bin
fish_add_path ~/aur/sdcc/bin
fish_add_path ~/aur/gbdk/bin
fish_add_path ~/aur/Emulicious
if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim='NVIM_APPNAME="nvim-kickstart" nvim'
    alias kvim='NVIM_APPNAME="nvim-kickstart" nvim'
    starship init fish | source
end

zoxide init fish --cmd=cd | source

# pnpm
set -gx PNPM_HOME "/home/robin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
