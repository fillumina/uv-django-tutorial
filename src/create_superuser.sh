#!/bin/sh

echo "creating super user admin:admin..."

echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell
