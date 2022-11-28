# Config Files
This repo contains all the *dotfiles* of the programs I use.

## Packages
Here's a list of packages (from the standard arch repos and from the AUR as well)
that contains (some of) the things that I use:
1. **Desktop**:
     - polybar
     - picom
     - xorg
     - xorg-xinit
     - xclip
     - arandr
     - i3-gaps
     - rofi
     - libnotify
     - dunst
2. **Fonts**:
     - ttc-iosevka
     - iosevka-nerd
     - noto-fonts
     - noto-fonts-cjk
     - noto-fonts-emoji
3. **Development and other**:
     - alacritty
     - zsh
     - base
     - base-devel
     - git

## Neovim
The plugin manager I use is [packer](https://github.com/wbthomason/packer.nvim), so that needs to be installed in order to have the plugins work:

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Other than that, there are some language servers that also need to be installed:
 - [Lua](https://github.com/sumneko/lua-language-server)

## TODO:
 - Make the `install.sh` script
 - Configure *rofi*
 - Configure *dunst*
 - Configure *zsh* plugins
 - Set up **LSP** for Neovim
 - Split Neovim LSP related stuff in separate files
