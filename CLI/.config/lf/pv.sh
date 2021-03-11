#!/bin/sh

case "$1" in
	*.tar*) tar tf "$1";;
	*.zip) unzip -l "$1";;
	*.pdf) pdftotext "$1" -;;
	*.gif|*.webm|*.png|*.jpg|*.flac|*.opus|*.mkv|*.mp3|*.mp4) mediainfo "$1";;
	*) highlight -O ansi "$1" || cat "$1";;
esac
