# My dotfiles

Works on *nix, optimized for macOS.

Managed using [Stow](http://www.gnu.org/software/stow/), so you can pick and
choose which programs to install.

---

## Philosophy

Initially I tried entirely automating the entire install process, but quickly
found it wasn't worth the maintenance. Starting from scratch happens so rarely
for me that each time I was fiddling with the bootstrap scripts to work around
a random issue (often due to a new version of macOS).

Instead, it's simpler to install stuff by hand, and manage only the
configuration files (dotfiles) in this repo.

---

## Install steps on a clean macOS machine

1. Make hidden files/folder [visible in Finder](http://apple.stackexchange.com/questions/99213/is-it-possible-to-always-show-hidden-dotfiles-in-open-save-dialogs):

    ```shell
    defaults write -g AppleShowAllFiles -bool true
    ```

2. Clone this repo:

    ```shell
    git clone git@github.com:jeffwidman/dotfiles.git ~/.dotfiles
    ```

    If cloning to a server without a Github-connected SSH key use `https` instead:

    ```shell
    git clone https://github.com/jeffwidman/dotfiles.git ~/.dotfiles
    ```

3. Install desired binaries using your favorite package manager:
    - If on macOS, use [Homebrew](http://brew.sh/):
        1. Install Homebrew.
        2. Use [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) to install the stuff listed in the [`.Brewfile`](https://github.com/jeffwidman/dotfiles/blob/master/homebrew/.Brewfile):

              ```shell
              brew bundle --file=~/.dotfiles/homebrew/.Brewfile
              ```

            After the `.Brewfile` is symlinked into `~/.Brewfile`, just use:

              ```shell
              brew bundle --global
              ```

    - Make sure [`Stow`](https://www.gnu.org/software/stow/) gets installed, we'll use this later to symlink the dotfiles.
    - Ruby: Use [`rvm`](http://rvm.io/) instead of Homebrew. Much easier to manage gemsets, ruby versions, etc.
    - Node: Use [`nvm`](https://github.com/nvm-sh/nvm) instead of Homebrew for managing Node.

4. Switch the default shell to the `zsh` installed by Homebrew (it's a newer version than the macOS default):

    1. Append the path to Homebrew's installed `zsh`:

        ```shell
        sudo sh -c "echo $(brew --prefix)/bin/zsh >> /etc/shells"
        ```

    2. ```shell
       chsh -s $(brew --prefix)/bin/zsh
       ```

5. Install `prezto`:

    ```shell
    git clone --recursive git@github.com:sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```

    The default `prezto` instructions say to symlink the default config files.
    **Don't do this**; instead use `Stow` to symlink your own config files (instructions below).

    To update `prezto`:

      ```shell
      git pull && git submodule update --init --recursive
      ```

6. Now use `stow` to symlink whatever config files are relevant:

    1. ```shell
       cd ~/.dotfiles/
       ```

    2. `$ stow FOLDER_NAME` will symlink all the files inside of the folder into the parent directory (in this case, the user's home folder.)

    `stow` whatever is relevant:

      - `bash`
      - `git`
      - `homebrew` - stowable, `brew bundle --global` will use `$HOME/.Brewfile`
      - `iterm2` - my `.zshrc` file is configured to look for the shell integration file.
      - `pypi`
      - `ruby`
      - `ssh`
      - `tmux` - #TODO
      - `vim` - for when Neovim isn't available
      - `vimify` - `.inputrc` and `.editrc` make vim commands work in many interactive
      shells, for example the `mysql` and `postgres` shells
      - `zsh` - includes `prezto` config files

     `Stow` thoughtfully raises an error if the symlink destination already exists. For example, installing `zsh` creates a default `~/.zshrc` and `~/.zshlogin`. Just delete these default files before stowing your customized versions.

    If using a different OS than macOS, some packages may store their config files at a different location. For example, the fonts folder. Just specify the full destination path for `Stow`.

    More info:
      - <http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html>
      - <http://taihen.org/managing-dotfiles-with-gnu-stow/>
      - <http://kianmeng.org/blog/2014/03/08/using-gnu-stow-to-manage-your-dotfiles/>

7. Other config files that aren't `stow`able:
   - `nvim` - Neovim. No need to stow as it respects `$XDG_CONFIG_HOME`
   - `python` - not stowable, I basically use this as a cheat sheet to remind me of my favorite python packages.
   - VSCode IDE - don't backup its dotfiles, use its built-in settings sync instead.

8. Other apps I commonly install:

    - [Visual Studio Code](https://code.visualstudio.com/)
      - Settings and extensions are saved via the built-in settings sync.
      - Need to manually install the [shell command `code`](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line).
    - [iTerm2](https://www.iterm2.com/downloads.html)
    - [Cyberduck](https://cyberduck.io/?l=en)
    - [PGAdmin](https://www.pgadmin.org/download/macosx.php) or [Postico](https://eggerapps.at/postico/)
    - [MySQLWorkbench](http://dev.mysql.com/downloads/workbench/)
    - [Robomongo](https://robomongo.org/)
    - [SourceTree](https://www.sourcetreeapp.com/)
    - [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
    - [BetterTouchTool](https://boastr.net/)
    - [Rectangle](https://rectangleapp.com/)
    - [macOS `/etc/hosts` GUI](https://github.com/specialunderwear/Hosts.prefpane)

9. `zsh` completion scripts:

    Symlink any completion scripts into `/usr/local/share/zsh/site-functions/`.
    The filename must begin with an `_` or `zsh` will not read it. Prezto caches
    the output of `compinit`, to rebuild the cache do:

    ```shell
    # typically for me this is located in ~/.cache/prezto/zcompdump
    rm -rf "${XDG_CACHE_HOME:-$HOME/.cache}/prezto/zcompdump" && compinit
    ```

    Note: Many `homebrew` formulae automatically handle installing the formula's
    completion scripts. For example, `brew install the_silver_searcher`(`ag`)
    will also install a completion script for `ag` in `/usr/local/share/zsh/site-functions/`.

    Docker completion scripts - I opened <https://github.com/sorin-ionescu/prezto/issues/1459> to try to get this into `prezto`:

      ```shell
      ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
      ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion /usr/local/share/zsh/site-functions/_docker-machine
      ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose
      ````

---

## Misc Notes

List of possible macOS customizations: <https://mths.be/macos>

Favorite Colorschemes:

- `monokai`
- `solarized`
- `railscasts`

Favorite Fonts:

- Ubuntu Monospace including powerline fix
- Adobe Source Code (look for powerline fix)

---

## TODO

- add <https://github.com/skwp/dotfiles/blob/master/ctags/ctags> to make ctags parse ruby and js better
- how to use ctags <http://scholarslab.org/research-and-development/code-spelunking-with-ctags-and-vim/>

- Improve my vimrc and nvimrc - vim plugins:
  - vim-markdown Markdown syntax highlighting for Vim
  - syntastic (pylint, pep8, pyflakes linters)
  - youcompleteme
  - tasklist
  - taglist (and ctags) (tagbar as alternative?)
  - nerdtree
  - powerline
  - minibuffexplorer
  - the_silver_searcher (vs ctrlp?)

- add powerline - used in vim, [zsh](http://powerline.readthedocs.org/en/latest/usage/shell-prompts.html), ipython, and tmux

---

## License

Copyright 2015 Jeff Widman
Licensed under the MIT License
