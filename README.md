# Certificates for The Carpentries

There are two ways to build certificates from this repo, one depends on the python package cairosvg which in turn depends on cairo development libraries being installed. To use this method, use `bin/certificates.py` to build certificates.

The second, pure python method uses the python packages jinja2, jinja2-cli and svglib to build the certificates.

To build certificates this way, you can run:
```
jinja2 swc-attendance.svg -D name="Firstname Lastname" -D date="Nov. 6, 2017" -D instructor="Some Instructor Name" > lastname_firstname.svg
svg2pdf lastname_firstname.svg 
```

# Certificates for the SSI Events

You will need `jinja2` package and `jinja2-cli` and `rsvg-convert` command line tools installed.

`jinja2` is a Python package and can be installed via `pip`. `jinja2-cli` and `rsvg-convert` on a Mac can be 
installed via `brew` for example.

This is the older version of The Carpentries certificate generation scripts.

Bu running the scripts, you will get the certificates generated in SVG and PDF formats in the root of the project.

## Edinburgh Carpentries SFC Certificates
SVG files containing certificate templates for EdCarp Scottish Funding Council workshops are located in: 
`dc-attendance-python-sfc.svg`, `dc-attendance-r-sfc.svg`, `dc-attendance-sql-sfc.svg`.

To create certificates, you should run:
```
bin/create_sfc_certificates.sh  "[sql|r|python]" "date" "Participant 1" "Participant 2" ...
```
passing the type of certificate you want `[sql|r|python]` and a list of participants' names. 

## Generic Attendance Certificates
The SVG file containing a generic attendance certificate template is located in `ssi-attendance.svg`.

To create certificates, you should run:
```
bin/generate_attendance_certificates.sh  "event" "organiser" "date" "Participant 1" "Participant 2" ...
```

