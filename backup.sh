#!/bin/bash
source tools/colors.cfg
source config/environment.cfg

function CreateBackupDirectory {
  if [ -d $1 ]; then
    echo "Backup directory exists"
  else
    sudo mkdir $1 && \
    echo "Backup directory created"
  fi
}

function CreateVolume {
  if docker volume inspect $1 > /dev/null 2>&1; then
    echo "Jenkins volume is already created"
  else
    echo "Creating Jenkins data volume"
    docker volume create $1
    if [ $? -eq 0 ]; then
      echo "DONE"
    else
      echo "There was an error creating the volume"
    fi
  fi
}

echo -e ${COLOR_CYAN}

#CreateBackupDirectory ${JENKINS_BACKUP_DIRECTORY}
#CreateVolume ${JENKINS_VOLUME}

echo "Building Postgres image..."

# 1)
# Run a docker container with a Postgres DB.
# The data of the container is persisted in a data volume.
# You can check this with docker volume ls.
# This volume exists even if you stop or delete the container and you can
# mount it to other containers.

docker run \
#  --rm \
  -v ${BITBUCKET_DB_VOLUME_NAME}:/var/lib/postgresql/data \
  --name ${BITBUCKET_DB_CONTAINER_NAME} \
  -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
  -e POSTGRES_USER=${POSTGRES_USER} \
  -e POSTGRES_DB=${POSTGRES_DB} \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -p 5432:5432 \
  -d \
  postgres:${POSTGRES_VERSION}

# 2)
# Run a dedicated “restore” container which we use only to import the data
# into the data volume. After the import, we will mount the data volume
# into the actual Bitbucket container and you can delete the restore container.
# To start the container, navigate to the path with your restore scripts run:

docker run \
  -v ${BITBUCKET_VOLUME_NAME}:/var/atlassian/application-data/bitbucket \
  -v $(pwd):/restore \
  --name="bitbucket_restore" \
  --link ${BITBUCKET_DB_CONTAINER_NAME}:postgres \
  -itd \
  ubuntu

echo "DONE"

echo ""
echo "* You can inspect the recently created volume by running:"
echo "    docker volume inspect ${JENKINS_VOLUME}"
echo ""
echo "* You can find the mount point here:"
echo "    /var/lib/docker/volumes/${JENKINS_VOLUME}/_data"