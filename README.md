# .dotfiles

Config files for my development environment (Neovim, tmux, zsh)

Based on ![josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files) (Neovim, tmux, zsh) and [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua) (Neovim).

Rosé Pine colorscheme Alacritty and Neovim from [rosepinetheme.com](https://rosepinetheme.com/).

## Neovim Setup

1. To setup the Neovim config on a Mac or Linux system install ![Neovim](https://neovim.io/) first ([installation instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim))

1. Make sure you have a C compiler such as  `clang` or `gcc` as well as `nodejs` installed.

1. Copy the contents of `.config/nvim/` from the repo to `~/.config/nvim/`. All plugins should install with [Lazy](https://github.com/folke/lazy.nvim) once you open Neovim.

## tmux setup

1. Install ![tmux](https://github.com/tmux/tmux/wiki/Installing) and then ![tmux plugin manager](https://github.com/tmux-plugins/tpm) with: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`.

1. Copy the file .tmux.conf from the repository to your home folder.

1. Start tmux and press <prefix>+I (in this case `Ctrl + Space` then `I`) to install plugins.
