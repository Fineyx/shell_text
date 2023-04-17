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
	newpassword="newpassword$i" # setting new password
	
	echo -e "$newpassword\n$newpassword" | passwd $username &> /dev/null # change password
	echo "Change password for user: $username to $newpassword"
done
