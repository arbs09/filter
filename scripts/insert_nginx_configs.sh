#!/bin/bash

file_url1="https://raw.githubusercontent.com/arbs09/filter/master/nginx/bad_paths.conf"
file_url2="https://raw.githubusercontent.com/arbs09/filter/master/nginx/bad_useragents.conf"
nginx_folder="/etc/nginx/includes"

if [ ! -d "$nginx_folder" ]; then
    echo "Directory $nginx_folder does not exist. Creating it now..."
    mkdir -p "$nginx_folder"
    if [ $? -eq 0 ]; then
        echo "Directory $nginx_folder created successfully."
    else
        echo "Failed to create directory $nginx_folder. Exiting."
        exit 1
    fi
fi

echo "Downloading $file_url1..."
curl -s -o "$nginx_folder/$(basename "$file_url1")" "$file_url1"
if [ $? -eq 0 ]; then
    echo "Downloaded and overwritten $(basename "$file_url1") in $nginx_folder"
else
    echo "Failed to download $file_url1"
    exit 1
fi
chmod 644 "$nginx_folder/$(basename "$file_url1")"

echo "Downloading $file_url2..."
curl -s -o "$nginx_folder/$(basename "$file_url2")" "$file_url2"
if [ $? -eq 0 ]; then
    echo "Downloaded and overwritten $(basename "$file_url2") in $nginx_folder"
else
    echo "Failed to download $file_url2"
    exit 1
fi
chmod 644 "$nginx_folder/$(basename "$file_url2")"
