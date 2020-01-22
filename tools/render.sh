function Render {
    echo "Rendering all values in between {{ }}..."
    # variables
    BITBUCKET_VERSION_token="{{ BITBUCKET_VERSION }}" # find all these...
    BITBUCKET_VERSION_value=${BITBUCKET_VERSION} # replace with
    BITBUCKET_CONTAINER_NAME_token="{{ BITBUCKET_CONTAINER_NAME }}" # find all these...
    BITBUCKET_CONTAINER_NAME_value=${BITBUCKET_CONTAINER_NAME} # replace with

    # find and replace
    sed -e "s/${BITBUCKET_VERSION_token}/${BITBUCKET_VERSION_value}/g" \
        -e "s/${BITBUCKET_CONTAINER_NAME_token}/${BITBUCKET_CONTAINER_NAME_value}/g" \
        < $1 \
        > rendered-$1
}