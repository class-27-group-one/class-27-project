
<<mc
This script will create and upload ssh-keys to githubAPI
It automate the ssh-keygen process for github.
Shell scripting is good for automation
Please make sure you create a token before executing this script.
https://www.youtube.com/watch?v=3YgutlExHRo&t=3632s
watch the youtube video for clarity.
mc

echo "Enter your GitHub Personal Access Token:"
read -s token
echo "Enter a name for the keypair:"
read keypair

mkdir "$HOME/.ssh" > ~/_tmpfile 2>&1
keypath="$HOME/.ssh/$keypair"

f_AddKeytoGitHub () {
	sshkey=`cat "$keypath.pub"`
	echo "Copying the key to GitHub account."
	curl -X POST -H "Authorization: token $token" -H "Accept: application/vnd.github.v3+json" -d "{\"title\":\"$keypair\",\"key\":\"$sshkey\"}" https://api.github.com/user/keys > ~/_tmpfile 2>&1
	success=`grep -o verified ~/_tmpfile`
	if [ $success ]; then
		echo -n "Successfully copied the key to GitHub."
	else
		echo -n "Failure adding key to GitHub."
	fi
}

if [ ! -f "$keypath" -a ! -f "$keypath.pub" ]; then
	echo "Creating the ssh keypair. The keypair will be saved in $HOME/.ssh/"
	ssh-keygen -t rsa -N "" -f "$keypath" > ~/_tmpfile 2>&1
	if [ $? -eq 0 ]; then
		echo "Keypair successfully generated."
		chmod 400 "$keypath"
		f_AddKeytoGitHub
	else
		echo -n "Failure generating the keypair."
	fi
	# rm ~/_tmpfile
elif [ -f "$keypath" -a -f "$keypath.pub" ]; then
	echo "Key already exists."
	f_AddKeytoGitHub
	# rm ~/_tmpfile
else
	echo -n "One key exists in $HOME/.ssh/. Delete the key and re-run script to generate a new keypair."
fi

