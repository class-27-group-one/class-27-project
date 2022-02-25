#!/bin/bash
echo "please enter file"
read file
if [ -f "${file}" ]
then
        ls -l $file
        echo "grant all permissions to $file"
        chmod 777 $file
        ls -l $file
else
        echo Invalid file entry type, please try again
fi	
