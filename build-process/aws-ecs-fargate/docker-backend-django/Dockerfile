FROM python:3.12-slim

ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=settings

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core \
        build-essential \
        binutils \
        libproj-dev \
        gdal-bin \
        supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /home/django-aws-ecs-fargate
RUN mkdir -p /home/django-aws-ecs-fargate/media
WORKDIR /home/django-aws-ecs-fargate


RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt



EXPOSE 8090

RUN mkdir -p /var/logs/backend


COPY ./build-process/aws-ecs-fargate/docker-backend-django/scripts /home/docker/scripts
COPY ./build-process/aws-ecs-fargate/docker-backend-django/config/supervisor-backend.conf /etc/supervisor/conf.d/supervisor-backend.conf

RUN sed -i 's/\r$//' /home/docker/scripts/boot.sh  && \
        chmod +x /home/docker/scripts/boot.sh

ENTRYPOINT /home/docker/scripts/boot.sh
COPY . /home/django-aws-ecs-fargate


