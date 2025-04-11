# .dotfiles

Each subdirectory is a package. Within each package the directory structure
is a mirror relative to the target directory. The files in the subdirectory
are symlinked to the target directory. The subdirectory is not included in
the symlink. The target directory is the parent directory by default. Use
stow options to specify a different target directory.

Each package must be stowed individually. The stow command is used to create
symlinks in the target directory. The stow command is run from this directory.

```sh
stow -S git
stow -S zsh
stow -S nvim
```

## Requirements

- [ ] git
- [ ] stow
- [ ] zsh
  - [ ] starship
- [ ] nvim
