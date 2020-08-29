#!/bin/bash

# Variabale holds data, Functions holds commands. When you call functions it execute all the commands declared in function.

# Declare function

sample () {
    echo Hello World from Function
    echo a = ${a}
    b=20 
}

# Call the function 

# Main Programm
a=10
sample
echo b = ${b}

# Observations

# 1. Functions are always before main program
# 2. Variables in Main Program can be accessed in funcion & Vise-Versa
# 