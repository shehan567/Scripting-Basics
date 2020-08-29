#!/bin/bash


# Exit status rangers from 0-255
# Success - 0
# 1-125 - Faliure, Partial failure

# exit 0

# User is suggested to use values only from 1-125, Because beyond system uses those numbers


sample () {
    echo hello
    echo script name = $0
    echo first argument = $1
    return 20
    echo bye 
}


sample abo

echo Exit status of Sample Function = $?


