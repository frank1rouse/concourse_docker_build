#
# TODO: Create a docker-compose file for developers
#       Create a named docker volume
#       Mount the volume under /root/.m2/
#       This allows downloaded maven packages to be cached between runs
#
# NOTE: The build team would use the image without the compose file
#       to ensure the maven packages are *not* cached between runs
#
# To build the container, run the following docker command
#
#   docker build -t symphony-build-server:latest .
#
# To use this container to build Symphony, start the container with the 
# following CLI options
#
#   docker run -d --privileged --name symphony-dev -v `pwd`:/build -v `pwd`/cache:/root/.m2  symphony-build-server
#
# This will run the container in the background. This is done
# so that the init process will run which can be used to spawn
# a docker daemon inside of the container. This is needed for
# packaging a symphony build.
#
# To attach to the container, use the CLI
#
#   docker exec -it symphony-dev sh
#
# Now you can build the symphony code.
#
#   cd /build
#   ls
#   cd <project>
#   mvn clean install
#

#
# Start with a recent version of Alpine with openjdk installed
#
FROM josebarn/dcind

#
# Add additional build tools that are needed
RUN apk update && \
    apk add maven \
            go go-tools \
            rpm \
            git git-bash-completion \
            zip unzip \
            docker-bash-completion \
            bash bash-completion \
            make py-pip \
            curl

# add to the python environment
RUN pip install github3.py
RUN pip install chainmap
