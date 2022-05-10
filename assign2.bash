#!/bin/bash

##### assign2.bash #####
## Author: Aidan Chang  rnl094
## This is a program that when in conjunction used with assign2.sed in the same directory,
## replaces sensitive student information in a text file with X's.

if [[ $# == 0 ]]; then
    #no command line arguments
    echo "Please provide an input file in argument."
    exit 1

else
    sed -i -r -f assign2.sed "$@"      # takes in command line arguments in list seperately
    
fi