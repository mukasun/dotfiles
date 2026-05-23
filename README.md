<div align="center">
    <h1>📂 dotfiles</h1>
</div>


## Overview

This [dotfiles](https://github.com/mukasun/dotfiles) repository is managed with [`chezmoi🏠`](https://www.chezmoi.io/), a great dotfiles manager.
The setup scripts are aimed for [MacOS](https://www.apple.com/jp/macos), [Ubuntu Desktop](https://ubuntu.com/desktop), and [Ubuntu Server](https://ubuntu.com/server). The first two (MacOS/Ubuntu Desktop) include settings for `client` machines and the latter one (Ubuntu Server) for `server` machines.

The actual dotfiles exist under the [`home`](https://github.com/mukasun/dotfiles/tree/main/home) directory specified in the [`.chezmoiroot`](https://github.com/mukasun/dotfiles/blob/main/.chezmoiroot).
See [.chezmoiroot - chezmoi](https://www.chezmoi.io/reference/special-files-and-directories/chezmoiroot/) more detail on the setting.

The following are the tools and coding assistants I mainly use in this setup.


## Setup

To set up the dotfiles run the appropriate snippet in the terminal.


### 💻 `MacOS` [![MacOS](https://github.com/mukasun/dotfiles/actions/workflows/macos.yaml/badge.svg)](https://github.com/mukasun/dotfiles/actions/workflows/macos.yaml)

- Configuration snippet of the Apple Silicon MacOS environment for client macnine:

```console
bash -c "$(curl -fsLS http://mukasun.me/dotfiles/setup.sh)"
```


### 🖥️ `Ubuntu` [![Ubuntu](https://github.com/mukasun/dotfiles/actions/workflows/ubuntu.yaml/badge.svg)](https://github.com/mukasun/dotfiles/actions/workflows/ubuntu.yaml)

- Configuration snippet of the Ubuntu environment for both client and server machine:

```console
bash -c "$(wget -qO - http://mukasun.me/dotfiles/setup.sh)"
```


### Minimal setup

The following is a minimal setup command to install chezmoi and my dotfiles from the github repository on a new empty machine:

> sh -c "$(curl -fsLS get.chezmoi.io)" -- init mukasun --apply

## Install & Setup Application Individually

This repository provides for the installation and setup of each application individually.
The desired application can be installed as follows (e.g., docker installation on MacOS):

```shell
bash install/macos/common/docker.sh
```

Each installation script can be found under the [`./install`](https://github.com/mukasun/dotfiles/tree/main/install) directory.

## Update & Test

Updating and testing the dotfiles follows [chezmoi's daily operations](https://www.chezmoi.io/user-guide/daily-operations/).
To verify that the updated scripts work correctly, run the scripts on the actual local machine and on the docker container.

### Develop the Setup Scripts

The setup scripts are stored as shellscripts in an appropriate location under the [`./install`](https://github.com/mukasun/dotfiles/tree/main/install) directory.
After verifying that the shellscript works, store the [chezmoi template](https://www.chezmoi.io/user-guide/templating/)-based file, which is based on the shellscript, in an appropriate location under the [`./home/.chezmoiscripts`](https://github.com/mukasun/dotfiles/tree/main/home/.chezmoiscripts) directory.

Below is the correspondence between shellscript and template for docker installation on MacOS.

- The shellscript for docker: [`install/macos/common/docker.sh`](https://github.com/mukasun/dotfiles/blob/main/install/macos/common/docker.sh)
- The chezmoi template for docker: [`home/.chezmoiscripts/macos/run_once_10-install-docker.sh.tmpl`](https://github.com/mukasun/dotfiles/blob/main/home/.chezmoiscripts/macos/run_once_10-install-docker.sh.tmpl)

### Test on the Local Machine

Currently, chezmoi does not automatically reflect updated configuration files (ref. [twpayne/chezmoi#2738](https://github.com/twpayne/chezmoi/discussions/2738)).
The following command will execute the [`chezmoi apply`](https://www.chezmoi.io/reference/commands/apply/) command as soon as the file is modified using [`watchexec`](https://github.com/watchexec/watchexec).

```shell
make watch
```

The chezmoi documentation mentions automatica application by [`watchman`](https://facebook.github.io/watchman/).
See [https://www.chezmoi.io/user-guide/advanced/use-chezmoi-with-watchman/](https://www.chezmoi.io/user-guide/advanced/use-chezmoi-with-watchman/) for more detail.


### Unit Test with [Bats](https://github.com/bats-core/bats-core) [![Unit test](https://github.com/mukasun/dotfiles/actions/workflows/test.yaml/badge.svg)](https://github.com/mukasun/dotfiles/actions/workflows/test.yaml)

Test the shellscript for setup with [Bash Automated Testing System (bats)](https://github.com/bats-core/bats-core).
The scripts for the unit test can be found under [`./tests`](https://github.com/mukasun/dotfiles/tree/main/tests/install) directory.


## Acknowledgements

Inspiration and code was taken from many sources, including:

- [twpayne/chezmoi](https://github.com/twpayne/chezmoi) from [twpayne](https://github.com/twpayne).
- [mukasun/dotfiles](https://github.com/mukasun/dotfiles): macOS / Ubuntu dotfiles from [@mukasun](https://github.com/mukasun).

## License

The code is available under the [MIT license](https://github.com/mukasun/dotfiles/blob/main/LICENSE).
