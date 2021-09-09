#!/bin/bash

## docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
sudo apt-get install libjpeg-dev
## sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
mkdir /home/gittmp/
git clone https://github.com/SydneyBioX/cornell_sc_workshop /home/gittmp/
## wget all data files from Google Cloud Storage into /home/CPC/
wget https://www.dropbox.com/s/jdowy5rl2s2fk2u/data.zip -P /home/gittmp/
cd /home/gittmp/ && unzip ./data.zip
rm -rf /home/gittmp/__MACOSX
rm -rf /home/gittmp/data.zip
ls /home/
ls /home/gittmp/

## Set up users

sudo groupadd trainees

for((userIndex = 1; userIndex <= 25; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  # sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2020 | sudo chpasswd
}
done
