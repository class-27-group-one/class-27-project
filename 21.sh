#!/bin/bash

echo “Please enter a file”
read PASSED

if [ -f "${PASSED}" ] ; then
    echo "$PASSED is a file";
	cat -n $PASSED | sort 
else
	echo "${PASSED} is not valid";
        exit 1
fi

