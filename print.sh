#!/bin/bash

# echo command to print the input provided

echo hello world
echo
echo Hello Universe
 # Print multiple lines
 echo -e "Hello World\nHello Universe"


 # When you are using \n to print multiple new lines, quote the input also enable -e option

 # Color           Code
  #######################
# Red         |     31
# Green       |     32
# Yellow      |     33
# Blue        |     34
# Magenta     |     35
# Cyna        |     36

# echo -e "\e[COLOR-CODEmMESSAGE"

echo -e "\e[31mRED"
echo -e "\e[32mGREEN"
echo -e "\e[33mYELLOW"
echo -e "\e[34mBLUE"
echo -e "\e[35mMAGENTA"
echo -e "\e[36mCYNA"

# https://misc.flogisoft.com/bash/tip_colors_and_formatting

# to disable the color code at the end of the input still in the bracket use "\e[0m"

echo -e "\e[31mAFTER\e[32mTHIS\e[34mNO\e[33mCOLORS\e[0m"

echo This Line should not Print Any Colors 


