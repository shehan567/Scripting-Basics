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

