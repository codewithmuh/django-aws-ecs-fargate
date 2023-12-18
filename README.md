# Deploy Django Application on AWS ECS Fargate


### 1. Clone Repository 

----
  ```sh
  git clone https://github.com/codewithmuh/django-aws-ecs-fargate.git

  ```
----  


### 2.  Setup  Two Options
1. Local Setup
2. Deploy on AWS ECS Fargate

### Quick Local Setup

1. Make sure you Docker desktop or docker daemon is running . 
you can install docker from office website.

2. 
----
  ```sh
  docker compose -f "build-process/aws-ecs-fargate/docker-compose-django-backend.yml" up -d --build

  ```
----
### Deploy on AWS ECS Fargate

#### Step 1: Configure AWS CLI with a Profile Name

Ensure that you have AWS CLI installed. If not, download and install it from the [official AWS CLI website](https://aws.amazon.com/cli/).

Run the following command and replace `YOUR_AWS_PROFILE_NAME` with your desired AWS CLI profile name:

```sh
aws configure --profile YOUR_AWS_PROFILE_NAME

```
----

Replace YOUR_AWS_PROFILE_NAME with the desired name for your AWS CLI profile.

Input AWS Access Key ID: Enter your AWS Access Key ID when prompted.

Input AWS Secret Access Key: Enter your AWS Secret Access Key when prompted.

Default Region: Specify the default AWS Region you want to use for this profile.




1. Open deploy-prod.sh file and make chnage,
 Replace YOUR_AWS_PROFILE_NAME, YOUR_REGION_NAME, YOUR_ACCOUNT_ID, YOUR_ECR_REPO_NAME, YOUR_CLUSTER_NAME, YOUR_SERVICE_NAME


 2. Then Run this command, it will build eocker image, and push image to ecr, It will also update ecs service

----

  ```sh
build-process/aws-ecs-fargate/deploy-prod.sh

  ```
----