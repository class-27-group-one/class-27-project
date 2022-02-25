
#!/bin/bash
echo “Please enter a file or a directory”
read PASSED
if [ -d "${PASSED}" ] ; then
    	echo "$PASSED is a directory";
	ls
else
    if [ -f "${PASSED}" ]; then
        echo "${PASSED} is a file";
	cat $PASSED
    else
        echo "${PASSED} is not valid a file or directory";
    fi
fi
