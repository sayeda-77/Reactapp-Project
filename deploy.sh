#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sayeda77 -p dckr_pat_VPY-9NwBDEwI0PpfGcF3l8ujH28

    # Build the Docker image (replace "image" with the actual image name)
    docker build -t react-appimg .

    # Tag the image
    docker tag react-appimg dev/dockerhub/repository:latest

    # Push the image to the Dev Docker Hub repository
    docker push sayeda77/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sayeda77 -p dckr_pat_VPY-9NwBDEwI0PpfGcF3l8ujH28

    # Build the Docker image (replace "image" with the actual image name)
    docker build -t react-appimg .

    # Tag the image
    docker tag react-appimg prod/dockerhub/repository:latest

    # Push the image to the Prod Docker Hub repository
    docker push sayeda77/prod
else
    echo "Deployment error"
fi

