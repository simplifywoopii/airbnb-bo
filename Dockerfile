FROM python:alpine3.19
LABEL maintainer="simplifywoopii@gmail.com"

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app

RUN python -m venv /py &&\
    /py/bin/pip install --upgrade pip &&\
    /py/bin/pip install -r /tmp/requirements.txt &&\
    rm -rf /tmp


ENV PATH=$PATH:/py/bin

WORKDIR /app

EXPOSE 8000

CMD [ "/py/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]