#!/bin/bash

#Author: Sam Munroe
#Date: 02/24/16
#Website: www.sammunroe.com
#Comments: This is a script I wrote for my Unix System Administration class. It asks you for first name, last name, zip code, and email. As the user enters there info the script uses my regex to validate each entry. 

#Name must start with a capital letter followed by any number of letters.
nameRegex="^[A-Z][a-z']+$"
#Zip can only be 5 digits. Not this only works with 5 digit zip codes.
zipRegex="^[0-9]{5}$"
#Checks to make sure email is formatted correctly
emailRegex="^[A-Za-z0-9._-]+@[A-Za-z0-9_.-]+\.[A-Za-z]{2,4}$"

echo "Enter a first name"
read firstName

#NOTE: the code will exit if a bad entry has been entered into the terminal
if [[ $firstName =~ $nameRegex ]]; then
	echo "Enter a last name"
	read lastName
	if [[ $lastName =~ $nameRegex ]]; then
		echo "Enter a zipcode"
		read zipcode
        	if [[ $zipcode =~ $zipRegex ]]; then
			echo "Enter an email address"
			read email
			if [[ $email =~ $emailRegex  ]]; then
				echo "Validated!"
			else
				echo "Bad Email"
				exit
			fi
		else
			echo "Bad zipcode"
			exit
                fi
        else
                echo "Bad last name"
		exit
        fi
else
	echo "Bad first name"
	exit
fi
