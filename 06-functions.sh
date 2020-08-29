#!/bin/bash

# Variabale holds data, Functions holds commands. When you call functions it execute all the commands declared in function.

# Declare function

sample () {
    a=30
    echo Hello World from Function
    echo a in Function = ${a}
    b=20 
}

# Call the function 

# Main Programm
a=10
sample
echo a in Main Program = ${a}
echo b in Main Program = ${b}


# Observations

# 1. Functions are always before main program
# 2. Variables in Main Program can be accessed in funcion & Vise-Versa
# 3. Variables from Main Program can be overwritten by function & Vice-Versa
