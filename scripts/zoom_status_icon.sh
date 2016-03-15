#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

zoomed_option_string="@zoomed_icon"
unzoomed_option_string="@unzoomed_icon"

zoomed_icon_osx="Z"
zoomed_icon="Z"
unzoomed_icon=""

source $CURRENT_DIR/shared.sh

is_osx() {
	[ $(uname) == "Darwin" ]
}

zoomed_icon_default() {
	if is_osx; then
		echo "$zoomed_icon_osx"
	else
		echo "$zoomed_icon"
	fi
}

unzoomed_icon_default() {
  echo "$unzoomed_icon"
}

zoom_status() {
  # tmux list-panes -F '#F' | grep -q Z
  0
}

print_icon() {
	if $(zoom_status); then
		printf "$(get_tmux_option "$zoomed_option_string" "$(zoomed_icon_default)")"
	else
		printf "$(get_tmux_option "$unzoomed_option_string" "$(unzoomed_icon_default)")"
	fi
}

main() {
	print_icon
}
main
