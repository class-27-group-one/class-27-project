
#!/bin/bash

echo “Please enter a file or a directory”
read PASSED

if [ -f "${PASSED}" ] ; then
    echo "$PASSED is a file";
else
        echo "${PASSED} is not file";
        echo "${PASSED} Please enter a valid file name";
        exit 1
fi
