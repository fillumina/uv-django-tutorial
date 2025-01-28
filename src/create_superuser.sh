#!/bin/sh

# create superuser (admin:admin), use only for dev
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com
', 'admin')" | ./manage.py shell
