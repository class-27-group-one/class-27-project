#this an alternate version which shows the number of file in a directory instead of listing them
#!/bin/bash
echo "Please enter the filename"
read file
if [ -d $file ]
then
echo "$file is a directory"
echo "No. of files is $(find "$file" -type f | wc -l)"
#find "$file" -type f |ls -l "$file" |wc-l
elif [ -f $file ]
then
echo "$file is a regular file"
echo "It reads:"
cat $file
else
echo "$file does not exit. Please try again"
fi
