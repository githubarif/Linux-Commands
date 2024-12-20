#! /usr/bin/bash

# Linux Basic Commands

# File System Navigation

echo "List the contents of the home directory"

cd home
ls

echo "Change the current directory to /var/log and list its contents"

cd /var/log

echo "Find and display the path to the bash executable using the which command."

which bash

echo " Find current shell"

echo SHELL


# File and Directory Operations

echo "Create a directory named linux_fundamentals in your home directory."

cd /home
sudo mkdir linux_fundamentals
ls

echo"Inside linux_fundamentals, create a subdirectory named scripts."

cd linux_fundamentals
sudo mkdir scripts
ls

echo "Create an empty file named example.txt inside the linux_fundamentals directory."

sudo touch example.txt

echo "Copy example.txt to the scripts directory."

cp example.txt scripts
cd /scripts
ls


echo "Move example.txt from linux_fundamentals to linux_fundamentals/backup."

cd linux_fundamentals
sudo mkdir backup
sudo mv example.txt backup

echo "Change the permissions of example.txt to read and write for the owner, and read-only for the group and others."

sudo chmod 644 example.txt

echo "Verify the permission changes using ls -l"

ls -l


# File Modification

echo "Create a file named example.txt in your home directory."

cd /home
sudo touch example.txt

echo "Change the owner of example.txt to a user named student"

sudo useradd student
sudo chown student example.txt

echo "Change the group of example.txt to a group named students."

sudo chgrp students example.txt

echo "Verify the changes using appropriate commands."

ls -l


# Ownership

echo "Create a directory named project in your home directory."

sudo mkdir project

echo "Create a file named report.txt inside the project directory."

cd project
sudo touch report.txt

echo "Set the permissions of report.txt to read and write for the owner, and read-only for the group and others."

sudo chmod 644 report.txt

echo "Set the permissions of the project directory to read, write, and execute for the owner, and read and execute for the group and others"

sudo chmod 755 project

echo "Verify the changes using appropriate commands."

ls -l



# User add/modify

echo "Create a new user named developer."

sudo useradd -m developer
grep developer /etc/passwd

echo "Set the home directory of the user developer to /home/developer_home."

sudo mkdir -p /home/developer_home
sudo usermod -d /home/developer_home developer

echo "Assign the shell /bin/sh to the user developer."

sudo usermod -s /bin/sh developer

echo "Verify the new user's information."

grep developer /etc/passwd

echo "Change the username of the user developer to devuser."

sudo usermod -l devuser developer

echo "Add devuser to a group named devgroup."

sudo groupadd devgroup
sudo usermod -aG devgroup devuser

echo "Set the password of devuser to devpass. ( hint: use passwd command. Run passwd --help to see available options)"

sudo passwd devuser

echo "Verify the changes made to the user."

grep devuser /etc/passwd


# Hard/Soft Link

echo "Create a file named original.txt in your home directory."

sudo touch original.txt

echo "Create a symbolic link named softlink.txt pointing to original.txt."

sudo ln -s original.txt softlink.txt

echo "Verify the symbolic link and ensure it points to the correct file."

ls -l softlink.txt

echo "Delete the original file original.txt and observe the status of the symbolic link."

 sudo rm original.txt
ls -l softlink.txt

echo "Create a file named datafile.txt in your home directory."

sudo touch datafile.txt

echo "Create a hard link named hardlink.txt pointing to datafile.txt."

ln datafile.txt hardlink.txt

echo "Verify the hard link and ensure it correctly points to the file."

ls -l datafile.txt hardlink.txt

echo "Check the inode of both datafile.txt and hardlink.txt"

ls -i datafile.txt hardlink.txt

echo "Delete the original file datafile.txt and observe the status of the hard link."

sudo rm datafile.txt

echo "Find all .txt files in your home directory. ( use find command. Run find --help for usage)"

find ~/ -type f -name "*.txt"


# Package installation

echo "Update repo cache using apt/apt-get"

sudo apt update

echo "Install a package named tree"

sudo apt install tree


echo "Install gcloud CLI tool using apt ( Follow instructions from here: https://cloud.google.com/sdk/docs/install#deb )"

sudo apt update
udo apt install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg > /dev/null
sudo apt update
sudo apt install google-cloud-sdk
gcloud --version
gcloud init

