#!/bin/sh

for i in */; do
	if [[ "$i" =~ "media" ]]; then
		cd ./media
			for i in */; do echo "media/$i" && stow -t "$HOME" "$i"; done
		cd ../
	else
		echo "$i" && stow -t $HOME "$i"
	fi
done
