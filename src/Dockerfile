FROM python:3.12
EXPOSE 8000
RUN apt-get update && apt-get install -y curl vim
COPY . app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN python manage.py collectstatic --noinput
RUN chmod +x start.sh
ENV DJANGO_SETTINGS_MODULE=uvdjangotutorial.settings
ENV MANAGE_PY_PATH=manage.py
ENV ADMIN_USERNAME=admin
ENV ADMIN_PASSWORD=admin
ENV ADMIN_EMAIL=admin@localhost
ENTRYPOINT ["./start.sh"]
