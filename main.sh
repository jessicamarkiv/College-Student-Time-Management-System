#!/bin/bash

source functions.sh

while true; do

    echo "";
    show_menu

    read choice

    case $choice in  
        1) schedule_lookup;; 
        2) assignment_lookup;; 
        3) incomplete_assignment_lookup;;
        4) add_assignment;; 
        5) update_assignment;;
        *) echo "Not an option.";; 
    esac
done
