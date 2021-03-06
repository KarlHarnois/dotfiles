#!/usr/bin/env bash

source utils.sh

# package:options
declare -a PACKAGES=(
  # GNU core utilities (those that come with OS X are outdated)
  # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  'coreutils'
  'moreutils'
  # GNU `find`, `locate`, `updatedb`, and `xargs` are `g`-prefixed
  'findutils'
  # GNU `sed`, overwrites the built-in `sed`
  'gnu-sed:--default-names'

  # generic colouriser  http://kassiopeia.juls.savba.sk/~garabik/software/grc/
  'grc'

  'the_silver_searcher'
  'ack'
  'fzf'
  'git'
  'gnupg'
  'htop-osx'
  'reattach-to-user-namespace'
  'tmux'
  'wget:--enable-iri'
  'zsh'
  'zsh-syntax-highlighting'
  'rbenv'
  'z'

  'ctags'
  'vim:--override-system-vi'
  'neovim'

  'yarn:--ignore-dependencies'
)

main() {
  local i=''
  local -a parts=()
  local package=''

  execute "brew update --all" "Updated Homebrew"
  execute "brew upgrade `brew outdated`" "Upgraded outdated packages"

  for i in ${PACKAGES[@]}; do
    parts=(${i//:/ })
    package="${parts[0]}"

    if [ ${#parts[@]} -gt 1 ]; then
      package="$package ${parts[1]}"
    fi

    brew_install "${parts[0]}" "${package}"
  done

  execute "brew cleanup" "Removed outdated versions from the cellar"
}

main
