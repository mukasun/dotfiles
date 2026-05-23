#!/usr/bin/env bats

# bats file_tags=common
@test "[common] dotfiles" {
    files_exists=(
        "${HOME}/.config/git/ignore"
        "${HOME}/.config/git/config"
        "${HOME}/.local/bin/common/dev"
        "${HOME}/.local/bin/common/setup-gh"
        "${HOME}/.vimrc"
        "${HOME}/.tmux.conf"
        "${HOME}/.zshrc"
    )
    for file in "${files_exists[@]}"; do
        echo "Checking ${file}"
        [ -f "${file}" ]
    done
}
