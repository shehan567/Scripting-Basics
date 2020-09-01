#!bin/bash

# frontend
# MongoDB
# Redis
# MySQL
# RabbitMQ
# Cart
# Catalogue 
# Shipping
# Payment
# User 
# All 

Head() {
    echo -e "\t\t\e[5;1;4;34m$1\e[0m"
}

## Stat is used for validation of the perticular operation is successfull or not. It's done by using the exit status. 

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

## This STAT_CONT is used only to check the operation passed or fail, but continue to next step. 

Stat_Cont() {
    case $1 in
     0)
        echo -e "$2 - \e[32mSUCCESS\e[0m"
        ;;
        *)
        echo -e "$2 - \e[31mFAILED\e[0m"
        ;;
    esac
}

frontend () {
    Head "Installing Frontend Service"
    ## yum remove nginx -y &>> $LOG_FILE             (unzip -o option in line 59 replaced this command & line 49, because -o option overwrites previous installs)
    ## Stat_Cont $? "Removed Previous Nginx\t\t\t"


    yum install nginx -y &>> $LOG_FILE      # Installing Nginx & Sending the out put to LOG_FILE, So no messages will be shown and it will be logged in the file.
    Stat $? "Nginx Install\t\t\t\t"


    curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/98e5c57f-66c8-4828-acd6-66158ed6ee33/_apis/git/repositories/65042ce1-fdc2-4472-9aa2-3ae9b87c1ee4/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
    Stat $? "Download Frontend Files\t\t\t"     
    cd /usr/share/nginx/html
    rm -rf *                                       
    
    unzip -o /tmp/frontend.zip &>> $LOG_FILE
    Stat $? "Extract frontend files\t\t\t" 
    mv static/* . &>> $LOG_FILE
    Stat_Cont $? "mv static\t\t\t\t"
    rm -rf static README.md
    Stat $? "README.md file Removal\t\t\t"
    mv localhost.conf /etc/nginx/nginx.conf
    Stat $? "MOVE localhost.conf to nginx.conf\t"

    systemctl enable nginx
    systemctl start nginx
    Stat $? "Start Nginx\t\t\t\t"
    ps -ef | grep nginx 
}

mongodb () {
    Head "Installing MongoDB Service"

    ## unzip -o Replaced all those below commands

## cd /tmp
## rm -rf mongodb.zip
## Stat $? "Removed Previous mongodb.zip file\t"
## rm -rf mongodb-27017.sock
## Stat $? "Removed mongodb-27017.sock\t\t"
## rm -rf catalogue.js
## Stat $? "Removed Catalogue.js file\t\t"
## rm -rf users.js
## Stat $? "Removed users.js file\t\t\t"
## rm -rf README.md
## Stat $? "Removed README.md file\t\t\t"
## cd - &>> $LOG_FILE

    ## unzip -o Replaced all those above commands


    echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
Stat_Cont $? "Download MongoDB Repo\t\t\t"
yum install -y mongodb-org &>> $LOG_FILE
Stat $? "Install MongoDB Service\t\t\t"
systemctl enable mongod &>> $LOG_FILE
systemctl start mongod &>> $LOG_FILE
Stat $? "Start MongoDB Service\t\t\t"

cd /tmp



curl -s -L -o /tmp/mongodb.zip "https://dev.azure.com/DevOps-Batches/98e5c57f-66c8-4828-acd6-66158ed6ee33/_apis/git/repositories/52feee4a-7c54-4f95-b1f5-2051a56b9d76/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true" &>> $LOG_FILE
Stat $? "Download MongoDB Schema\t\t\t"
unzip -o mongodb.zip &>> $LOG_FILE
Stat $? "Extract MongoDB Schema\t\t\t"
mongo < catalogue.js &>> $LOG_FILE
Stat $? "Load Catalogue Schema\t\t\t"
mongo < users.js &>> $LOG_FILE
Stat $? "Load User Schema\t\t\t"
}

redis () {
    Head "Installing Redis Service"
}

mysql () {
    Head "Installing MySQL Service"

    curl -L -o /tmp/mysql-5.7.28-1.el7.x86_64.rpm-bundle.tar https://downloads.mysql.com/archives/get/p/23/file/mysql-5.7.28-1.el7.x86_64.rpm-bundle.tar &>> $LOG_FILE
    Stat $? "Download MySQL Bundle\t\t"

    cd /tmp
    tar -xf mysql-5.7.28-1.el7.x86_64.rpm-bundle.tar &>> $LOG_FILE
    Stat $? "Extract MySQL Bundle\t\t"

    yum remove mariadb-libs -y
    yum install mysql-community-client-5.7.28-1.el7.x86_64.rpm mysql-community-common-5.7.28-1.el7.x86_64.rpm mysql-community-libs-5.7.28-1.el7.x86_64.rpm mysql-community-server-5.7.28-1.el7.x86_64.rpm -y &>> $LOG_FILE
    stat $? "Install MySQL Database\t\t"

    

}

rabbitmq () {
    Head "Installing RabbitMQ Service"
}

cart () {
    Head "Installing Cart Service"
}

catalogue () {
    Head "Installing catalogue Service"



    useradd roboshop 
    Stat_Cont $? "roboshop User Add"

    curl -s -L -o /tmp/catalogue.zip "https://dev.azure.com/DevOps-Batches/98e5c57f-66c8-4828-acd6-66158ed6ee33/_apis/git/repositories/73bf0c1f-1ba6-49fa-ae4e-e1d6df20786f/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true" &>> $LOG_FILE
    Stat $? "Downloaded Catalogue.zip"

    cd /home/roboshop
    
    mkdir catalogue
    cd catalogue

    unzip -o /tmp/catalogue.zip
    npm install
    node server.js &>>catalogue.log 

}

shipping () {
    Head "Installing Shipping Service"
}

payment () {
    Head "Installing Payment Service"
}

user () {
    Head "Installing User Service"
}

USAGE() {
    echo -e "Usage\t\t\t : $0 \e[1;4;30m<Choose component from below list with the script>\e[0m"
    echo -e "Components\t\t : \e[32mfrontend \e[33mmongodb \e[34mredis \e[35mmysql \e[36mrabbitmq \e[34mcart \e[32mcatalogue \e[33mshipping \e[34mpayment \e[35muser\e[0m"
    echo -e "For all components use\t : all"
    exit 1
}

## Main Programm

LOG_FILE=/tmp/roboshop.log 
rm -f $LOG_FILE 

## This below command is to check if you are the root user or not

ID_USER=$(id -u)
case $ID_USER in
    0) true ;;   ## In certain cases don't do this approach, it may cause some issues, Will be discusses later. The root user or sudo user value = 0. true command does nothing in Linux.  
    *)           ## If you get any other value do as it in below. 
        echo -e "\t\t\e[1;4;31mScript should be run as root user or sudo\e[0m" ## \t - Tab Space, 1; - Bold Text, 4; is to underline.  
        USAGE
        ;;
    esac

case $1 in 
    frontend)
        frontend   
        ;;

    mongodb)
        mongodb
        ;;

    redis)
        redis
        ;;

    mysql)
        mysql;;

    rabbitmq)
        rabbitmq
        ;;

    cart)
        cart
        ;;

    catalogue)
        catalogue
        ;;

    shipping)
        shipping
        ;;

    payment)
        payment
        ;;

    user)
        user
        ;;

    all)
        frontend
        mongodb
        redis
        mysql
        rabbitmq
        cart
        catalogue
        shipping
        payment
        user
        ;;
    *)
        USAGE
        ;;
esac

