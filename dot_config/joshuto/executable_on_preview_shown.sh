#!/usr/bin/env bash

TMP_FILE="$HOME/.cache/joshuto/thumbcache.png"

file="$1"
X="$2"
Y="$3"
width="$4"
height="$5"

function image {
	kitty +kitten icat --transfer-mode=file --clear 2>/dev/null
	kitty +kitten icat --transfer-mode=file --place "${width}x${height}@${X}x${Y}" "$1" 2>/dev/null
}

case $(file -b --mime-type "${file}") in
	image/*)
		image "${file}"
		;;
    *)
	    kitty +kitten icat --transfer-mode=file --clear 2>/dev/null
esac
