#!/bin/sh

echo "migrating..."
python manage.py migrate
echo "------------------"
echo "Migrations done"
python manage.py collectstatic --noinput
echo "------------------"
echo "Static files collected, starting server"
python manage.py runserver 0.0.0.0:8000
