#!/bin/bash
echo "This will hopefully checkout your project's svn:externals."

externals=$(git svn propget svn:externals)

completionMessage=""

while read -r svnExt 
do
	# Pre- and Post-1.5 svn:external format can be found here:
	# http://svnbook.red-bean.com/en/1.7/svn.advanced.externals.html

	# Currently, only "url path" is supported. "-rNNN url path" will break.
	
	# Change IFS to whitespace just to break $svnExt into an array.
	OIFS="$IFS"
	IFS=' '

	read -a singleProp <<< "${svnExt}"

	# Change IFS back.
	IFS="$OIFS"

	svnUrl=${singleProp[0]}
	dirPath=${singleProp[1]}
	
	printf "\nCloning: ${svnUrl}\ninto:\t${dirPath}\n"
	echo "---------------------------"
	printf "\n"

	git svn clone $svnUrl $dirPath

	completionMessage=${completionMessage}"\n${svnUrl} => ${dirPath}"

done <<< "$externals"


echo "All svn:externals have been cloned into their respective directories."
echo "---------------------------------------------------------------------"
printf "${completionMessage}\n"