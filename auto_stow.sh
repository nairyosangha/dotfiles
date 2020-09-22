#!/bin/bash
# command to delete all files stow complains about:
#  ./auto_stow.sh 2>&1 | grep '*' | cut -d':' -f2 | tr -d ' ' | xargs -I{} rm "${HOME}/{}"

cmd='stow -t'
while getopts 'd' opt; do
	case $opt in
		d) cmd='stow -D -t' ;;
		*) exit 1
	esac
done

for i in */; do
	if [[ "$i" =~ "media" ]]; then
		cd ./media
		for i in */; do echo "media/$i" && $cmd "$HOME" "$i"; done
		cd ../
	else
		echo "$i" && $cmd "$HOME" "$i"
	fi
done
