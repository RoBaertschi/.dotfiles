
# Setup

function v1
  fisher install jorgebucaran/fisher
  fisher install jorgebucaran/nvm.fish
  fisher install reitzig/sdkman-for-fish@v2.0.0
  fisher install budimanjojo/tmux.fish
  fisher install edc/bass

  curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash

  set -U fish_personal_setup 1

  set -U nvm_default_version latest
end


alias emsdk_setup ". /home/robin/aur/emsdk/emsdk_env.fish"

set -gx GBDKDIR ~/aur/gbdk
set -gx SDCCDIR ~/aur/sdcc

set -Ux fish_tmux_config $HOME/.config/tmux/tmux.conf
set -Ux fish_tmux_autoconnect false

fish_add_path ~/opt/cross/bin
fish_add_path ~/bin
fish_add_path ~/go/bin
fish_add_path ~/aur/zig/zigup/scratch/bin
fish_add_path ~/aur/sdcc/bin
fish_add_path ~/aur/gbdk/bin
fish_add_path ~/aur/Emulicious
fish_add_path /home/linuxbrew/.linuxbrew/bin
set -gx ZVM_INSTALL "$HOME/.zvm/self"
fish_add_path $ZVM_INSTALL
fish_add_path $HOME/.zvm/bin
if status is-interactive
  

    # Commands to run in interactive sessions can go here
    alias vim='NVIM_APPNAME="nvim-kickstart" nvim'
    alias kvim='NVIM_APPNAME="nvim-kickstart" nvim'
    starship init fish | source

    fzf --fish | source

  if not set -q fish_personal_setup
    echo "No fish_personal_setup"
    v1
  else if [ $fish_personal_setup != "1" ] 
    echo "Outdated fish setup version"
    v1
  end

  if set -q work_laptop
    bass source ~/.wsl4sc
  end
end

zoxide init fish --cmd=cd | source

# pnpm
set -gx PNPM_HOME "/home/robin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
