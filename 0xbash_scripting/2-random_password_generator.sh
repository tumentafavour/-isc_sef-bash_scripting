#!/bin/bash
echo "Enter the desired password length: "
read password_length
if ! [[ "$password_length" =~ ^[0-9]+$ ]] || [ "$password_length" -le 0 ]; then
    echo "Invalid password length. Please enter a positive number."
    exit 1
fi

LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SPECIAL_CHARS="!@#$%^&*()-_+="
 ALL_CHARS="${LOWERCASE}${UPPERCASE}${DIGITS}${SPECIAL_CHARS}"

password=""
num_all_chars=${#ALL_CHARS}


for (( i=0; i<password_length; i++ )); do
    random_index=$(( RANDOM % num_all_chars ))
    password="${password}${ALL_CHARS:$random_index:1}"
done

echo "Generated Password: $password"











