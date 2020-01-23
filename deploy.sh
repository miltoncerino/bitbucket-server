#!/bin/bash
source tools/colors.cfg
source config/environment.cfg
source tools/render.sh

function CreateVolume {
  if docker volume inspect $1 > /dev/null 2>&1; then
    echo "Bitbucket volume $1 is already present"
  else
    echo "Creating Bitbucket volume $1"
    docker volume create $1
    if [ $? -eq 0 ]; then
      echo "DONE"
    else
      echo "There was an error creating the volume"
    fi
  fi
}

printf ${COLOR_BLUE}

CreateVolume ${POSTGRES_VOLUME_NAME}
CreateVolume ${BITBUCKET_VOLUME_NAME}

Render bitbucket-compose.yaml
docker-compose -f rendered-bitbucket-compose.yaml up -d

echo "DONE"
printf ${COLOR_STANDARD}