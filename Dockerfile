FROM python:alpine3.19
LABEL maintainer="simplifywoopii@gmail.com"

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app

RUN python -m venv /py &&\
    /py/bin/pip install --upgrade pip &&\
    /py/bin/pip install -r /tmp/requirements.txt &&\
    source /py/bin/activate &&\
    rm -rf /tmp

ENV PATH=$PATH:/py/bin
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN /py/bin/python manage.py makemigrations &&\
    /py/bin/python manage.py migrate

EXPOSE 8000

# cmd
CMD [ "/py/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]