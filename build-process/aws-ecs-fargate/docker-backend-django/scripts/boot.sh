#!/bin/bash
set -e

echo "django-aws-ecs-fargate:boot:env:${APP_ENVIRONMENT}"

# python manage.py migrate
# python manage.py collectstatic --noinput

if [ "$APP_ENVIRONMENT" != "Local" ]; then
  echo "django-aws-ecs-fargate:run:local" && python manage.py runserver 0.0.0.0:8080 --insecure
fi

if [ "$APP_ENVIRONMENT" == "Production" ]; then
  echo "django-aws-ecs-fargate:run:prod" && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisor-backend.conf
fi