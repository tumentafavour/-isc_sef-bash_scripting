#!/bin/bash
echo "enter a directory path:"
read input_directory
if [ ! -d "$input_directory" ]; then 
echo "error:directory '$input_directory'not found. "
exit 1
fi

echo "$(ls) $input_directory"

echo " File name   |   Line count "
echo "-------------|-------------"
for file in "$input_directory"/*; do
if [ -f "$file" ]; then
file_name="${file##*/}"
line_count=$(wc -l < "$file")
printf "%-10s| %d\n"  "$file_name" "$line_count" 
fi
done
