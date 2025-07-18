#!/bin/bash


echo "enter source directory"
read source_directory


echo "enter backup destination"
read backup_destination


if [ ! -d "$source_dir" ]; then
  echo "Error: Source directory '$source_dir' does not exist."
  exit 1
fi


if [ -d "$dest_dir" ]; then
  if [ ! -w "$dest_dir" ]; then
    echo "Error: Destination directory '$dest_dir' is not writable."
    exit 1
  fi
else
  
  mkdir -p "$dest_dir"
  if [ $? -ne 0 ]; then
    echo "Error: Unable to create destination directory '$dest_dir'."
    exit 1
  fi
fi


cp -r -avz "$source_dir/" "$dest_dir/"
if [ $? -eq 0 ]; then
  echo "Backup successful: Files copied from '$source_dir' to '$dest_dir'."
else
  echo "Error: Backup failed."
fi
