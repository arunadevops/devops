#!/bin/sh
#Script developped to backup git. 

#Create Backups folder 
mkdir -p ~/backups;cd ~/backups

#input your git project , if you dont give git project then exit 

if [ $# -ne 1 ]; 
    then 
       echo "In Order to run the script , please provide a valid git repository name"
       exit;
    else 
       echo "Valided inputs successfully"
fi

#Projectname 
GHUSER=$1; 


#get the list of repos for the project 
curl "https://api.github.com/users/$GHUSER/repos?per_page=100" | grep -o 'git@[^"]*' >repos1.out 


sed s#'git@github.com:'#'https://github.com/'# repos.out  >projects.out 

#Generate the API Urls so that you can fetch the list of branches for the api urls. 
# eg:- git@github.com:wardviaene/terraform-provider-aws.git --> https://api.github.com/repos/wardviaene/terraform-provider-aws/branches
# sed -e 's#.git$#/branches#' -e 's#git@github.com:#https://api.github.com/repos/#' repos1.out >api.out


# Backups Start - take api.out as input and then extract branches for each api url. 

for i in `cat api.out`
do
echo "********"
echo listing brnaches for $i
#curl $i | grep name 

repo='echo $i | cut -d'/' -f6'
curl --silent $i  | grep name | cut -d'"' -f4 >$repo_branches.out 

echo "**********"
done

# Backup logic to be updated in above for loop

# issues - 
#1. API Requests , Limit exceeded is coming. 
#2. this script only works if the gitrepo is public, and will only work for github. 
     
     #bitbucket, azure devops. There needs to be some change 
     #can u give me the list of github urls or a sample url and read access to it to check this furthur. 
     
     
