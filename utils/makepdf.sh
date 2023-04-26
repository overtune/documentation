#!/bin/bash

renderPdf () {
	FROM_FILE="$1"
	TO_FILE="$2"
	pandoc "$FROM_FILE" \
		-f gfm \
		-V linkcolor:blue \
		-V geometry:a4paper \
		-V geometry:margin=2cm \
		--pdf-engine=xelatex \
		-o "$TO_FILE"
}

renderPdf "./docs/version-control-and-deployments.md" "./pdfs/version-control-and-deployments.pdf"

docker run --rm \
       --volume "$(pwd):/data" \
       --user $(id -u):$(id -g) \
       pandoc/core version-control-and-deployments.md -o version-control-and-deployments.pdf
