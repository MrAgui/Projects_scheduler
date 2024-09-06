#!/bin/bash
echo "[+] Getting user input..."

capitalize_name() {
    local name="$1"
    name=$(echo "$name" | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
    echo "$name"
}

get_user_input() {
    read -p "Enter name: " name

    name_lower=$(echo "$name" | tr '[:upper:]' '[:lower:]')

    if [[ "$name_lower" == "print" ]]; then
        source ./subscripts/print_user.sh
        exit 0
    fi

    name=$(capitalize_name "$name")

    if [[ -z "$name" ]]; then
        echo "[!] Name cannot be empty. Exiting."
        exit 1
    fi

    echo "Select shift:"
    echo -e "\t 1. Morning (6am - 3pm)"
    echo -e "\t 2. Mid (2pm - 11pm)"
    echo -e "\t 3. Night (10pm - 7am)"
    read -p "Enter the number corresponding to your shift: " shift_num

    case $shift_num in
        1) shift="Morning"; time="6am - 3pm" ;;
        2) shift="Mid"; time="2pm - 11pm" ;;
        3) shift="Night"; time="10pm - 7am" ;;
        *) echo "[!] Invalid shift selection. Exiting..."; exit 1 ;;
    esac

    echo "Select team:"
    echo -e "\t 1. A1"
    echo -e "\t 2. A2"
    echo -e "\t 3. B1"
    echo -e "\t 4. B2"
    echo -e "\t 5. B3"
    read -p "Enter the number corresponding to your team: " team_num

    case $team_num in
        1) team="A1" ;;
        2) team="A2" ;;
        3) team="B1" ;;
        4) team="B2" ;;
        5) team="B3" ;;
        *) echo "[!] Invalid team selection. Exiting..."; exit 1 ;;
    esac
}

get_user_input
