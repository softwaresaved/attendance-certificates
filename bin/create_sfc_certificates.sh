#!/bin/bash

usage () {
	cat <<HELP_USAGE
Usage: $0  [sql|r|python] "date" "Participant 1" ...
HELP_USAGE
}

if [ $# -lt 3 ]; then
	usage
fi

for name in "${@:3}"
do
	echo "Generating certificate for $name in file $name.svg"
	jinja2 dc-attendance-$1-sfc.svg -D name="$name" -D date="$2"  > "$name.svg"
	rsvg-convert --format=pdf --output="$name.pdf" "$name.svg"
done
