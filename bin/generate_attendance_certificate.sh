#!/bin/bash

usage () {
	cat <<HELP_USAGE
Usage: $0  "event" "organiser" "date" "Participant 1" ...
HELP_USAGE
}

if [ $# -lt 4 ]; then
	usage
fi

for name in "${@:4}"
do
	echo "Generating attendance certificate for $name in files $name.svg and $name.pdf."
	jinja2 ssi-attendance.svg -D event="$1" -D organiser="$2" -D name="$name" -D date="$3" > "$name.svg"
	rsvg-convert --format=pdf --output="$name.pdf" "$name.svg"
done
