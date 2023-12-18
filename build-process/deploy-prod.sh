#!/bin/bash

set -e
set -u
set -x

export AWS_PROFILE=YOUR_PROFILE_NAME

aws ecr get-login-password --region YOUR_REGION_NAME | \
    docker login --username AWS --password-stdin YOUR_ACCOUNT_ID.dkr.ecr.YOUR_REGION_NAME.amazonaws.com


docker buildx build --platform linux/amd64\
      -t YOUR_ACCOUNT_ID.dkr.ecr.YOUR_REGION_NAME.amazonaws.com/YOUR_ECR_REPO_NAME:production \
      -f ./build-process/aws-ecs-fargate-backend/docker-backend-django/Dockerfile . \
      --push



aws ecs update-service --cluster YOUR_CLUSTER_NAME --no-paginate --service 'YOUR_SERVICE_NAME' --force-new-deployment

git tag -a "v$(date +'%Y%m%d%H%M%S')" -m "New production release"
git push --tags





# codewithmuh.com
# youtube.com/@codewithmuh
# codewithmuh@gmail.com
