#!/bin/sh 

file="values.properties"


if [ -f $file ]; then
   echo "File $file exists."
else
   echo "File $file does not exist."
   exit;
fi

source  ./$file

#checking if the key pair exists or else create keypair 

x=`aws ec2 describe-key-pairs --key-name $keypair | grep KeyName | wc -l`
if [ $x -eq '0' ]
 then 
   echo "keypair doesnt exist Proceeding furthur and creating the Keypair"
   aws ec2 create-key-pair --key-name $keypair --query 'KeyMaterial' --output text >$keypair.pem 
   echo "created keypair successfully , describing keypair"
   aws ec2 describe-key-pairs --key-name $keypair
  else 
   echo "keypair exists"
fi

check_error()
           {
            if [ $? = 0 ]
              then
                echo "AWS Instance Creation  is successful"
              else
                echo "AWS Instance Creation has Failed"
              exit
             fi
            }


aws ec2 run-instances --image-id ami-0889b8a448de4fc44 --count 1 --instance-type $instance_type --key-name $keypair --region $region --user-data file://setup_docker.sh
check_error


