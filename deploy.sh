#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sayeda77 -p dckr_pat_VPY-9NwBDEwI0PpfGcF3l8ujH28

  
    # Tag the image
    docker tag react-appimg sayeda77/dev

    # Push the image to the Dev Docker Hub repository
    docker push sayeda77/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    # Build your project
    ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sayeda77 -p dckr_pat_VPY-9NwBDEwI0PpfGcF3l8ujH28

   
    # Tag the image
    docker tag react-appimg sayeda77/prod 

    # Push the image to the Prod Docker Hub repository
    docker push sayeda77/prod
else
    echo "Deployment error"
fi

