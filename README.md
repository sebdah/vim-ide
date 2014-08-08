# vim-ide

## Features

* Code completion
* [Command T](https://github.com/wincent/Command-T) for project file search
* Many colorschemes
* Git integration using [fugitive](https://github.com/tpope/vim-fugitive)
* [NERDTree](https://github.com/scrooloose/nerdtree) file browsing
* Clear trailing whitespace
* vim-airline status bars (with git support)
* Tab completion using [supertab](https://github.com/ervandew/supertab)
* Tab completion in search field ([SearchComplete](https://github.com/vim-scripts/SearchComplete))
* Code tag list support ([Taglist](http://vim-taglist.sourceforge.net/index.html))

Included colorschemes:

- Tomorrow
- Tomorrow-Night
- Tomorrow-Night-Blue
- Tomorrow-Night-Bright
- Tomorrow-Night-Eighties
- molokai
- solarized (dark and light)
- vividchalk

Supported languages:

* Markdown
* Node.js
  - JSHint
* Python
  - Pylint

## Requirements

- `vim` (7.4 or above)
- `git`
- `ruby`
- `gcc`
- `ctags` (if you're on a Mac, install `ctags` via [Homebrew](http://brew.sh/))

## Usage

### Shortcuts

#### File browsing

- `, + d` - Open the file browser side bar (via [NERDTree](https://github.com/scrooloose/nerdtree))
- `, + f` - Show the current file in the file browser (via [NERDTree](https://github.com/scrooloose/nerdtree))
- `, + t` - Quick file opening (via [Command T](https://github.com/wincent/Command-T))
- `shift + T` - Open file in new tab from the file browser

#### Tag list

- `, + T` - Toggle tag list ([Taglist](http://vim-taglist.sourceforge.net/index.html))
- `, + Ta` - Add file(s) to the tag list ([docs](http://vim-taglist.sourceforge.net/manual.html#:TlistAddFiles))
- `, + Tar` - Add file(s) recursively to the tag list ([docs](http://vim-taglist.sourceforge.net/manual.html#:TlistAddFilesRecursive))

### Git integration

Git integration is provided via the [fugitive](https://github.com/tpope/vim-fugitive) plugin. Below are some common examples.

**Status**

    :Gstatus

**Commit (all)**

    :Gcommit
    :Gcommit -a

**Diff**

    :Gdiff

**Push**

    :Gpush origin master

### CoffeeScript

Vinter supports CoffeeScript syntax, compiling, linting and indenting (via [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)). Check their [documentation](https://github.com/kchmck/vim-coffee-script) for details on how to compile and lint your code.

