#!/bin/bash

# Frontend
# MongoDb
# Redis
# MySQL
# RabbitMQ
# Cart
# Catalogue
# Shipping
# Payment
# User
# All
#

# Functions needs to be set up first like below

frontend () {
    echo "Installing Frontend Service"
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

    
    
    cart)
        cart
        ;;
    
    all)

