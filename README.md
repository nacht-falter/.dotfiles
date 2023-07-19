# .dotfiles
Config files for my development environment (Neovim, tmux, ZSH, iTerm).

Based on ![josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files) (Neovim, tmux, yabai and skhd) and [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua) (Neovim).

Rosé Pine colorscheme for iTerm and Neovim from [rosepinetheme.com](https://rosepinetheme.com/).

## Neovim Setup

1. To setup the Neovim config on a Mac or Linux system install ![Neovim](https://neovim.io/) first ([installation instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim)) and then ![packer](https://github.com/wbthomason/packer.nvim) by running `git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

2. Make sure you have a C compiler such as  `clang` or `gcc` as well as `nodejs` installed. 

3. Then copy only the file `.config/nvim/lua/nacht-falter/packer.lua` from the repository to `~/.config/nvim/lua/nacht-falter/` and open it with Neovim. When you save the file all the plugins will be installed automatically.

4. Close nvim and now copy the entire contens of `.config/nvim/` from the repo to `~/.config/nvim/`.

## tmux setup

1. Install ![tmux](https://github.com/tmux/tmux/wiki/Installing) and then ![tmux plugin manager](https://github.com/tmux-plugins/tpm) with: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`.

2. Copy the file .tmux.conf from the repository to your home folder.

## yabai and skhd setup
1. Install yabai and skhd with homebrew:

  `brew install koekeishiya/formulae/yabai`

  `brew install koekeishiya/formulae/skhd`

2. Copy the files `yabairc` to `~/.config/yabai/` and `skhdrc` to `~/.config/skhd`

