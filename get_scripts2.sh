#!/bin/sh
#Script developped to backup git. 

#Create Backups folder 
mkdir -p ~/backups_chaitanya;cd ~/backups_chaitanya

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
sed -e 's#.git$#/branches#' -e 's#git@github.com:#https://api.github.com/repos/#' repos1.out >api.out


# Backups Start - take api.out as input and then extract branches for each api url. 

mkdir ~/list1 

for i in `cat api.out`
do
echo "********"
echo listing brnaches for $i
#curl $i | grep name 

repo=`echo $i | cut -d'/' -f6`
curl --silent $i  | grep name | cut -d'"' -f4 >~/list1/$repo.out 
echo "**********"
done

cd ~/list1

for i in `ls *.out`
do
echo $i
repo_val=`echo $i | cut -d'.' -f1`
  for x in `cat $i`
   do 
   mkdir -p ~/backups_chaitanya/${repo_val}_${x}; > backup_autogen_Script.sh
   cd ~/backups_chaitanya/${repo_val}_${x}; >> backup_autogen_Script.sh
   echo git clone http://github.com/$GHUSER/$repo_val.git -b ${x} >>backup_autogen_Script.sh
   done
done

chmod a+x backup_autogen_Script.sh 
./backup_autogen_Script.sh 
