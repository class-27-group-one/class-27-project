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



#this is maeva's version. It runs each permission.
if test -r $file 
then
echo "File has read access" 
else
echo "File does not have read access"
sudo chmod +r $file
echo “read access added”
fi
if test -w $file 
then
echo "File has write permission" 
else
echo "File does not have write permission"
sudo chmod +w $file
echo “write access added”
fi
if test -x $file
then
echo "File has execute permission" 
else
echo "File does not have execute permission"
sudo chmod +x $file
echo “execute permission added”
fi
