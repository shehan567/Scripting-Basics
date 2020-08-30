#!/bin/bash

# Redirectors are used to direct the Out Put of a command to a different location mostly as a file which is called as a out put redirector and use a file as an Input to a command which is called as input redirewctor. 
# > - Output Redirector
# < - Input Redirector


# Example

ls >/tmp/out

cat /tmp/out

# Run those below commands in AWS Server as automation

#  echo Check this input redirector

#  sudo yum install mariadb-server -y

#  systemctl enable mariadb-server

# then use automation to display databases using by using Input Redirector

# vi /tmp/input

# show databases; written in tmp/input

# Then use Input redirector < like this, mysql </tmp/input

# Also you can use both together for example mysql takes the input from the file and send the output to another file

# mysql </tmp/input >/tmp/out



 





