# Neovim Setup

Refer to the full [`dotfiles`](https://github.com/1git2clone/dotfiles) for a
showcase of the workflow. This was ported over from the dotfiles via
[`git-filter-repo`](https://github.com/newren/git-filter-repo).

> [!IMPORTANT]
> This repo is **NOT** meant to be used as a submodule, instead it should be
> located at `~/<repo>` and used alongside your dotfiles, as the way
> [`stow_setup.sh`](./stow_setup.sh) is set up ensures that it will work even
> if `~/.config` is a symlink to your dotfiles directory or an absolute path.
