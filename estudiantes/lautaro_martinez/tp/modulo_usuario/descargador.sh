#!/bin/bash

read -p "Ingresa un número > " num_files

ftp_server="localhost"
ftp_user="tuiaedpuser"
ftp_password="tuiaedpuser"

# Connect to the FTP server and list files
file_list=$(curl -s "ftp://$ftp_server" --user "$ftp_user:$ftp_password")
echo "filelist >> $file_list"
# Check if the FTP connection was successful
if [ $? -ne 0 ]; then
    echo "Error: Unable to connect to the FTP server."
    exit 1
fi

# Convert the file list to an array
IFS=$'\n' read -d '' -r -a files <<< "$file_list"

# Get the total number of files
total_files="${#files[@]}"

# Check if there are enough files to download
if [ "$total_files" -lt "$num_files" ]; then
    echo "Error: There are only $total_files files available on the FTP server."
    exit 1
fi

# Initialize an array to store indices of selected files
selected_indices=()

# Generate unique random indices until reaching the desired number
while [ "${#selected_indices[@]}" -lt "$num_files" ]; do
    # Generate a random index within the range of available files
    random_index=$((RANDOM % total_files))

    # Check if the index is unique (not already selected)
    if ! [[ " ${selected_indices[@]} " =~ " $random_index " ]]; then
        selected_indices+=("$random_index")
    fi
done

# Download the specified number of random files
for index in "${selected_indices[@]}"; do
    file_to_download="${files[$index]}"
    # Remove leading whitespace and store the filename
    filename="${file_to_download##*[[:space:]]}"
    echo "Descargando: $file_to_download"
    echo $filename
    curl -C - -o "outputs/$filename" -s "ftp://$ftp_server/$filename" --user "$ftp_user:$ftp_password"
done

echo "Downloaded $num_files random files from the FTP server."
