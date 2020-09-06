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

URL=$(curl -s https://nodejs.org/en/download/ | xargs -n1 | grep linux-x64.tar | sed -e 's|=| |g' -e 's|>| |g'| xargs -n1 | grep ^http)
FILENAME=$(echo $URL | awk -F / '{print $NF}')
FOLDER_NAME=$(echo $FILENAME |sed -e 's/.tar.xz//')

curl -s -o /tmp/$FILENAME $URL 

Stat $? "NODEJS INSTALL\t\t\t\t"

cd /opt
tar -xf /tmp/$FILENAME
mv $FOLDER_NAME nodejs
ln -s /opt/nodejs/bin/node /bin/node || true
ln -s /opt/nodejs/bin/npm /bin/npm  || true
ln -s /opt/nodejs/bin/npx /bin/npx || true
