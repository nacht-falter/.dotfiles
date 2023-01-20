# dev-env-files
Config files for my development environment (Neovim, tmux, ZSH, iTerm).

Based on ![josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files) (Neovim and tmux) and [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua) (Neovim).

Rosé Pine colorscheme for iTerm and Neovim from [rosepinetheme.com](https://rosepinetheme.com/).

## Neovim Setup

1. To setup the Neovim config on a Mac or Linux system install ![Neovim](https://neovim.io/) first and then ![packer](https://github.com/wbthomason/packer.nvim) by running `git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

2. Then copy only the file .config/nvim/nacht-falter/lua/packer.lua from the repository to ~/.config/nvim/nacht-falter/lua and it with Neovim. When you save the file all the plugins will be installed automatically.

3. Close nvim and now copy the entire contens of `.config/nvim/` from the repo to `~/.config/nvim/`.

## tmux setup

1. Install ![tmux](https://github.com/tmux/tmux/wiki/Installing) and then ![tmux plugin manager](https://github.com/tmux-plugins/tpm) with: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`.

2. Copy the file .tmux.conf from the repository to your home folder.
