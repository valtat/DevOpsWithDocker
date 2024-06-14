#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github_repo> <dockerhub_repo>"
  exit 1
fi

GITHUB_REPO=$1
DOCKERHUB_REPO=$2
GITHUB_REPO_URL="https://github.com/$GITHUB_REPO.git"
IMAGE_TAG="latest"

git clone $GITHUB_REPO_URL
if [ $? -ne 0 ]; then
  echo "Failed to clone the GitHub repository."
  exit 1
fi

REPO_NAME=$(basename $GITHUB_REPO .git)

cd $REPO_NAME

docker build -t $DOCKERHUB_REPO:$IMAGE_TAG .
if [ $? -ne 0 ]; then
  echo "Failed to build the Docker image."
  exit 1
fi

echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
if [ $? -ne 0 ]; then
  echo "Failed to log in to DockerHub."
  exit 1
fi

docker push $DOCKERHUB_REPO:$IMAGE_TAG
if [ $? -ne 0 ]; then
  echo "Failed to push the Docker image to DockerHub."
  exit 1
fi

echo "Docker image pushed to DockerHub successfully."

