#!/bin/bash

# If we name to some data then that name is called a variable

# When it comes to data we have different types, 1. Numbers, 2. Floatind Values, 3. Characters, 4. Strings, 5. Booleans

a=10
b=xyz
c=true
d=9.9999

# Shell by default does not support data types. Everything is a string. 

# Access variable :  ${a} or $a, In some scenarios we use {} see line 17

echo $a
echo ${a}000 #This will print 10000

DATE=$(date +%F)
echo Good Morning, Today's date 


