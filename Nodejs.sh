#!bin/bash


Stat() {
        case $1 in
        0)
        echo -e "$2 - \e[32mSUCCESS\e[0m"
        ;;
        *)
        echo -e "$2 - \e[31mFAILED\e[0m"
        exit 1
        ;;
    esac
}


yum install gcc-c++ -y 

URL=$(curl -s https://nodejs.org/en/download/ | xargs -n1 | grep linux-x64.tar | sed -e 's|=| |g' -e 's|>| |g'| xargs -n1 | grep ^http) &>> $NODE_FILE

FILENAME=$(echo $URL | awk -F / '{print $NF}') &>> $NODE_FILE

FOLDER_NAME=$(echo $FILENAME |sed -e 's/.tar.xz//') &>> $NODE_FILE

curl -s -o /tmp/$FILENAME $URL &>> $NODE_FILE

Stat $? "NODEJS INSTALL\t\t\t\t"

cd /opt
tar -xf /tmp/$FILENAME &>> $NODE_FILE

mv $FOLDER_NAME nodejs
ln -s /opt/nodejs/bin/node /bin/node || true
ln -s /opt/nodejs/bin/npm /bin/npm  || true
ln -s /opt/nodejs/bin/npx /bin/npx || true


## Main program

LOG_FILE=/tmp/nodejs.log 
rm -f $NODE_FILE 
