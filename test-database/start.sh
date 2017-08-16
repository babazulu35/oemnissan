#!/bin/sh

echo "Starting DB..."
docker run --name db -d \
    -e MYSQL_ROOT_PASSWORD=123 \
    -e MYSQL_DATABASE=users -e MYSQL_USER=user_service -e MYSQL_PASSWORD=123 \
    -p 3306:3306 \
    mysql:latest

echo "Waiting for DB to start up..."
docker exec db mysqladmin --silent --wait=30 -uuser_service -p123 ping || exit 1 

echo "Setting up initial data..."
docker exec -i db mysqluusers_service -p123 users < setup.sql