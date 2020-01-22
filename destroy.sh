#!/bin/bash
source tools/colors.cfg
source config/environment.cfg

function DeleteVolume {
  if docker volume inspect $1 > /dev/null; then
    echo "Deleting data volume: $1"
    docker volume rm $1
    if [ $? -eq 0 ]; then
      echo "Data volume \'$1\' has been removed"
    else
      echo "There was an error deleting the volume"
    fi
  else
    echo "Volume \'$1\' was not found"
  fi
}

echo -e ${COLOR_RED_LIGHT}

echo "Killing/Removing Bitbucket container..."
docker kill ${BITBUCKET_CONTAINER_NAME} && docker rm ${BITBUCKET_CONTAINER_NAME}
echo "Killing/Removing Postgres container..."
docker kill ${POSTGRES_CONTAINER_NAME} && docker rm ${POSTGRES_CONTAINER_NAME}

read -p "Would you like to remove the Bitbucket and Postgres Docker images? [y/N] " delImages
case ${delImages} in
     y)      
          docker rmi atlassian/bitbucket-server:${BITBUCKET_VERSION} postgres:${POSTGRES_VERSION}
          ;;
     *)
          ;;
esac

echo "Removing Docker volumes makes information unaccessible in the future."
read -p "Would you like to remove the Bitbucket and Postgres Docker volumes? [y/N] " delVolumes
case ${delVolumes} in
     y)      
          DeleteVolume ${BITBUCKET_VOLUME_NAME}
          DeleteVolume ${POSTGRES_VOLUME_NAME}
          ;;
     *)
          ;;
esac

echo "DONE"