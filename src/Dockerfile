FROM python:3.12
EXPOSE 8000
RUN apt-get update && apt-get install -y curl vim
COPY . app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN python manage.py collectstatic --noinput
RUN chmod +x start.sh
RUN chmod +x create_superuser.sh
RUN /app/create_superuser.sh
ENV DJANGO_SETTINGS_MODULE=uvdjangotutorial.settings
ENTRYPOINT ["./start.sh"]
