#this is maeva's version. It runs each permission instead of listing them
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
