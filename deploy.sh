#!/bin/bash
source tools/colors.cfg
source config/environment.cfg

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

echo -e ${COLOR_CYAN}

CreateVolume ${BITBUCKET_DB_VOLUME_NAME}
CreateVolume ${BITBUCKET_VOLUME_NAME}

docker-compose -f bitbucket-compose.yaml up -d