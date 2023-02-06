#!/bin/bash

# Declare an associative array to store the user names and their new passwords
declare -A users

# Define the users and their new passwords in the array
users=( [user1]=newpassword1 [user2]=newpassword2 [user3]=newpassword3 )

# Loop through the array of users and update each one's password
for user in "${!users[@]}"
do
  # Run the MySQL command to change the password for the current user
  mysql -e "SET PASSWORD FOR '$user'@'localhost' = PASSWORD('${users[$user]}');"
done
