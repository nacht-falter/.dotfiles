# dev-env-files
Config files for my development environment (Neovim, tmux, ZSH, iTerm).


Based on ![josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files) (Neovim and tmux) and [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua) (Neovim).


Rosé Pine colorscheme for iTerm and Neovim from [rosepinetheme.com](https://rosepinetheme.com/).

## Neovim Setup

1. To setup the Neovim config on another unix system install Neovim first and then packer: `git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

2. Then copy the folder .config/nvim/nacht-falter/lua from the repository to ~/.config/nvim/nacht-falter/lua and open the file packer.lua with Neovim. When you save the file all the plugins will be installed.

3. Close nvim and delete the nvim folder within `~/.config`. Then create a symbolic link to the nvim folder in the repository by running `ln -s .config/nvim ~/.config/nvim` from the repository folder. Like this you can just pull changes from the repo without having to copy any files.
