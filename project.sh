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
    echo -e "\t\t\e[1;4;34m$1\e[0m"
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

frontend () {
    Head "Installing Frontend Service"
    yum install nginx -y &>> $LOG_FILE      # Installing Nginx & Sending the out put to LOG_FILE, So no messages will be shown and it will be logged in the file.
    Stat $? "Nginx Install"
    curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/98e5c57f-66c8-4828-acd6-66158ed6ee33/_apis/git/repositories/65042ce1-fdc2-4472-9aa2-3ae9b87c1ee4/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
    Stat $? "Download Frontend Files"     
    cd /usr/share/nginx/html                         
    rm -rf *                                       
    unzip /tmp/frontend.zip &>> $LOG_FILE
    Stat $? "Extract frontend files" 
    mv static/* 
    rm -rf static README.md
    mv localhost.conf /etc/nginx/nginx.conf
    systemctl enable nginx
    systemctl start nginx
    Stat $? "Start Nginx"
    ps -ef | grep nginx
}

mongodb () {
    Head "Installing MongoDB Service"
}

redis () {
    Head "Installing Redis Service"
}

mysql () {
    Head "Installing MySQL Service"
}

rabbitmq () {
    Head "Installing RabbitMQ Service"
}

cart () {
    Head "Installing Cart Service"
}

catalogue () {
    Head "Installing catalogue Service"
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

