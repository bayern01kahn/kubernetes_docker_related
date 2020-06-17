#curl -H 'Authorization: token yourToken' 'https://api.github.com/user/repos?&page=1&per_page=100' | grep -e 'ssh_url*' | cut -d \" -f 4 | xargs -L1 git clone
#curl -H 'Authorization: token yourToken' 'https://api.github.com/user/repos?&page=1&per_page=100' | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone

#step 1
#curl -H 'Authorization: token yourToken' 'https://api.github.com/user/repos?&page=1&per_page=100' > repos0.json
#step 2
#cat repos0.json | grep -e 'ssh_url*' | cut -d \" -f 4 | xargs -L1 git clone



another version: from github:
需要先知道 用户名和总页数

sh  xx.sh userName totalPage


#!/bin/bash

if [ -z "$1" ]; then
    echo "waiting for the following arguments: username + max-page-number"
    exit 1
else
    name=$1
fi

if [ -z "$2" ]; then 
    max=2
else
    max=$2
fi

cntx="users"
page=1

echo $name
echo $max
echo $cntx
echo $page

until (( $page -lt $max ))
do 
    curl "https://api.github.com/$cntx/$name/repos?page=$page&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
    $page=$page+1
done

exit 0
