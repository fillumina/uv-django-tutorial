#!/bin/sh

export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=admin
export ADMIN_EMAIL=admin@localhost

echo "migrating..."
./manage.py makemigrations
./manage.py migrate
echo "------------------"
echo "Migrations done"
./manage.py collectstatic --noinput
echo "------------------"
echo "Static files collected, starting server"
./manage.py runserver 0.0.0.0:8000
