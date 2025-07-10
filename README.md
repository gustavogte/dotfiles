# 🏠 My Dotfiles

This is my personal set of dotfiles, designed to be clean, portable, and reproducible across machines. It includes:

- ⚙️ Shell: `zsh`, `zprofile`, `p10k`
- 💻 Terminal: `wezterm`, `starship`
- 🧠 Editor: Neovim (Lua, lazy.nvim)
- 🔗 Managed with symlinks (manual or via Home Manager)

## 🛠 Setup Instructions

### 1. Clone the Repository

```bash
git clone git@github.com:your-username/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
```

### 2. Symlink to `$HOME`

```bash
ln -s ~/dev/dotfiles/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dev/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/dev/dotfiles/.config/nvim ~/.config/nvim
```

Or use [chezmoi](https://www.chezmoi.io/) or GNU [stow](https://www.gnu.org/software/stow/).

### 3. (Optional) Use with Home Manager

You can declare these dotfiles in `home.nix`:

```nix
home.file.".zshrc".source = ./dotfiles/.zshrc;
home.file.".gitconfig".source = ./dotfiles/.gitconfig;
home.file.".wezterm.lua".source = ./dotfiles/.wezterm.lua;
home.file.".config/nvim".source = ./dotfiles/.config/nvim;
```

Then run:

```bash
home-manager switch
```

---

MIT License