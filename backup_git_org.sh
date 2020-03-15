#!/bin/sh
#Script developped to backup git. 

#Create Backups folder 
backup_path=~/bkp_chaitu
mkdir -p $backup_path

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


sed s#'git@github.com:'#'https://github.com/'# repos1.out  >projects.out 

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

for i in `ls ~/list1/*.out`
do
echo $i
repo_val=`echo $i | cut -d'.' -f1 | cut -d'/' -f5`
  for x in `cat $i`
   do 
     if [ -d $backup_path/${repo_val}_${x} ] 
      then 
        cd $backup_path/${repo_val}_${x}/${repo_val}
        git pull
      else 
        mkdir -p $backup_path/${repo_val}_${x}; 
        cd $backup_path/${repo_val}_${x};
        git clone http://github.com/$GHUSER/$repo_val.git -b ${x}
     fi   
   done
done

#chmod a+x backup_autogen_Script.sh 
#./backup_autogen_Script.sh
