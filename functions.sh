#!/bin/bash

function schedule_lookup
{
    echo "";
    echo "Class Schedule Lookup";    
    echo "Enter Day of Week: ";

    read day_of_week
    output=$(grep -i $day_of_week ./schedule.txt)

    if [ -z "$output" ]
        then
            echo "You don't have any classes scheduled for $day_of_week.";
    else
        echo "";
        echo "Classes scheduled for $day_of_week:";
        echo $output;
    fi
}

function assignment_lookup
{
    echo "";
    echo "Assignments Due Today";
    echo "Enter Todays Date (mm/dd): ";

    read todays_date
    output=$(grep -i $todays_date ./assignments.txt)

    if [ -z "$output" ]
        then
            echo "You don't have any assignments due on $todays_date.";
    else
        echo "";
        echo "Assignments due on $todays_date:";
        echo $output;
    fi
}   

function incomplete_assignment_lookup
{
    echo "";
    echo "Incomplete Assignments:";

    output=$(grep -i "Incomplete" ./assignments.txt) 

    echo $output;
}   

function add_assignment
{
    echo "";
    echo "Add Assignment";

    echo "Assignment ID (###-##-##): ";
    read assignment_id

    echo "Due Date (mm/dd): ";
    read due_date

    echo "Subject: ";
    read subject

    echo "Level of Difficulty (Low, Medium, High): ";
    read level_of_difficulty

    echo "Estimated Time to Complete: ";
    read ettc

    echo "Status (Completed, Incomplete): "
    read status

    #write to file
    echo "$assignment_id: $due_date,$subject,$level_of_difficulty,$ettc,$status" >> assignments.txt

    echo "Assignment Added Successfully.";
}

function update_assignment
{
    echo "";
    echo "Update Assignment";

    echo "Which assignment would you like to update?";
    echo "ID:";
    cat assignments.txt    

    echo "";
    echo "Enter Assignment ID (###-##-##): ";
    read assignment_id

    output=$(grep -i "$assignment_id" ./assignments.txt)
    echo "What would you like to update? ";
    echo $output
    echo "1. Due Date";
    echo "2. Status";

    read choice
    case $choice in  
        1) echo "Enter Old Due Date (mm/dd): ";
            read old_due_date

           echo "Enter New Due Date (mm/dd): " 
            read new_due_date
            sed -i " /^$assignment_id/ s~$old_due_date~$new_due_date~g" assignments.txt ;;

        2) echo "Choose New Status:"
           echo "1. Completed";
           echo "2. Incomplete";
            read new_status 
            case $new_status in
                1) sed -i " /^$assignment_id/ s/Incomplete/Completed/g" assignments.txt ;;
                2) sed -i " /^$assignment_id/ s/Completed/Incomplete/g" assignments.txt ;;
                #*) echo "Not an option.";;
            esac
       #*) echo "Not an option.";; 
    esac

    echo "Update Complete.";
}

function show_menu
{
    echo "Menu: ";
    echo "1: Today's Classes"; 
    echo "2: Assignments Due Today";
    echo "3: All Incomplete Assignments";
    echo "4: Add Asssignment";
    echo "5: Update Assignment";
}


