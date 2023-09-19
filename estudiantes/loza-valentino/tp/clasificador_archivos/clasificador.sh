#!/bin/bash

download_dir="/home/edp-2023-ci/estudiantes/loza-valentino/tp/clasificador_archivos/temp"

output_dir="/home/edp-2023-ci/estudiantes/loza-valentino/tp/clasificador_archivos/output"

clasificador() {
	local file="$1"
	local file_type=$(file -b --mime-type "$file_name")

	case "$file_type" in
		"image/png")
			category="img"
			;;
		"audio/wav")
			category="snd"
			;;
		"text/plain")
			category="txt"
			;;
		*)
			echo "Archivo desconocido"
			return
			;;
	esac
	
	local filename=$(basename "$file")
	local new_file_name="${category}1.${file_name##*.}"
	
	mkdir -p "$output_dir/$category"
	mv "$file" "$output_dir/$category/$new_file_name"

	echo "Archivo clasificado y renombrado; $file_name > $new_file_name"
}
for file in "$local_download_dir"/*; do
	if [ -f "$file" ]; then
		clasificador "$file"
	fi
done
