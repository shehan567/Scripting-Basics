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

LOG_FILE=/tmp/roboshop.log 
rm -f $LOG_FILE 

## This below command is to check if you are the root user or not

ID_USER=$(id -u)
case $ID_USER in
    0) true ;;   ## In certain cases don't do this approach, it may cause some issues, Will be discusses later. The root user or sudo user value = 0. true command does nothing in Linux.  
    *)           ## If you get any other value do as it in below. 
        echo "Script should be run as root user or sudo"
        USAGE
        ;;
    esac


frontend () {
    echo "Installing Frontend Service"
    yum install nginx -y &>> $LOG_FILE      # Installing Nginx & Sending the out put to LOG_FILE, So no messages will be shown and it will be logged in the file.
    case $? in
        0)
        echo "Nginx Install - SUCCESS"
        ;;
        *)
        echo "Nginx Install - FAILED"
        exit 1
        ;;
    esac
}

mongodb () {
    echo "Installing MongoDB Service"
}

redis () {
    echo "Installing Redis Service"
}

mysql () {
    echo "Installing MySQL Service"
}

rabbitmq () {
    echo "Installing RabbitMQ Service"
}

cart () {
    echo "Installing Cart Service"
}

catalogue () {
    echo "Installing catalogue Service"
}

shipping () {
    echo "Installing Shipping Service"
}

payment () {
    echo "Installing Payment Service"
}

user () {
    echo "Installing User Service"
}

USAGE() {
    echo -e "Usage\t\t\t : $0 <Choose component from below list with the script>"
    echo -e "Components\t\t : frontend mongodb redis mysql rabbitmq cart catalogue shipping payment user"
    echo -e "For all components use\t : all"
    exit 1
}

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

