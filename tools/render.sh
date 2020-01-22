function Render {
    echo "Rendering all values in between {{ }}..."
    # variables
    BITBUCKET_VERSION_token="{{ BITBUCKET_VERSION }}" # find all these...
    BITBUCKET_VERSION_value=${BITBUCKET_VERSION} # replace with
    BITBUCKET_CONTAINER_NAME_token="{{ BITBUCKET_CONTAINER_NAME }}" # find all these...
    BITBUCKET_CONTAINER_NAME_value=${BITBUCKET_CONTAINER_NAME} # replace with
    BITBUCKET_VOLUME_NAME_token="{{ BITBUCKET_VOLUME_NAME }}"
    BITBUCKET_VOLUME_NAME_value=${BITBUCKET_VOLUME_NAME}
    POSTGRES_VERSION_token="{{ POSTGRES_VERSION }}"
    POSTGRES_VERSION_value=${POSTGRES_VERSION}
    POSTGRES_CONTAINER_NAME_token="{{ POSTGRES_CONTAINER_NAME }}"
    POSTGRES_CONTAINER_NAME_value=${POSTGRES_CONTAINER_NAME}
    POSTGRES_PASSWORD_token="{{ POSTGRES_PASSWORD }}"
    POSTGRES_PASSWORD_value=${POSTGRES_PASSWORD}
    POSTGRES_USER_token="{{ POSTGRES_USER }}"
    POSTGRES_USER_value=${POSTGRES_USER}
    POSTGRES_DB_token="{{ POSTGRES_DB }}"
    POSTGRES_DB_value=${POSTGRES_DB}
    POSTGRES_VOLUME_NAME_token="{{ POSTGRES_VOLUME_NAME }}"
    POSTGRES_VOLUME_NAME_value=${POSTGRES_VOLUME_NAME}

    # find and replace
    sed -e "s/${BITBUCKET_VERSION_token}/${BITBUCKET_VERSION_value}/g" \
        -e "s/${BITBUCKET_CONTAINER_NAME_token}/${BITBUCKET_CONTAINER_NAME_value}/g" \
        -e "s/${BITBUCKET_VOLUME_NAME_token}/${BITBUCKET_VOLUME_NAME_value}/g" \
        -e "s/${POSTGRES_VERSION_token}/${POSTGRES_VERSION_value}/g" \
        -e "s/${POSTGRES_CONTAINER_NAME_token}/${POSTGRES_CONTAINER_NAME_value}/g" \
        -e "s/${POSTGRES_PASSWORD_token}/${POSTGRES_PASSWORD_value}/g" \
        -e "s/${POSTGRES_USER_token}/${POSTGRES_USER_value}/g" \
        -e "s/${POSTGRES_DB_token}/${POSTGRES_DB_value}/g" \
        -e "s/${POSTGRES_VOLUME_NAME_token}/${POSTGRES_VOLUME_NAME_value}/g" \
        < $1 \
        > rendered-$1
}