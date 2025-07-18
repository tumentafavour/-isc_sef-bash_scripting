#!/bin/bash
declare -A users=(
    ["sir yannick"]="donmash123"
    ["arantis"]="securepass"
    ["madam loni"]="guestpass"
)

echo "--- Basic User Authentication System ---"

echo  "enter username "
read input_username

echo "enter password"
read -s input_ password


echo "" 


if [[ -v users["$input_username"] ]]; then
    
    if [[ "${users[$input_username]}" == "$input_password" ]]; then
        echo "Authentication successful! Welcome, $input_username."
    else
        echo "Authentication failed: Incorrect password for username '$input_username'."
    fi
else
    
    echo "Authentication failed: Username '$input_username' not found."
fi

echo "----------------------------------------"

