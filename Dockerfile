# docker image to extend
FROM python:3.7-alpine
MAINTAINER dyh

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create user instead of allowing root to run the project
# security purpose
RUN adduser -D user
USER user