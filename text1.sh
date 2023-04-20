#!bin/bash

for i in {1..100}  # create user
do 
	username="user$i"
	password="password$i"
	
	useradd -m $username # add user
	echo -e "$password\n$password" | passwd $username &> /dev/null # setting password
	echo "Create user: $username, password: $password" # create success
done

for i in {1..100..2} # find the odd users
do
	username="user$i"
	userdel -r $username # delete user
	echo "Delete user: $username"
done

for i in {2..100..2} # find the even users
do
	username="user$i"
	passwdtxt="newpassword$i" # set a unencrypted password
	newpassword=$(echo $passwdtxt | tr 'a-zA-Z' 'f-za-eF-ZA-E') # encryption
	
	echo -e "$newpassword\n$newpassword" | passwd $username &> /dev/null # change password
	echo "Change password for user: $username to $newpassword"
done
