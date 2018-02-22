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
            make \
            openjdk8 \
            py-pip \
            curl

# Add a JAVA_HOME definition
ENV JAVA_HOME=/usr/lib/jvm/default-jvm

# add to the python environment
RUN pip install github3.py
RUN pip install chainmap

