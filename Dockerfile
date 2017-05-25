#############################################################
# Dockerfile to build container for Synapse Python client
#############################################################

# Base Image
FROM ubuntu:16.04

LABEL version="1.1.2"

# File Author / Maintainer
MAINTAINER James Eddy <james.a.eddy@gmail.com>

# set up packages
USER root

ENV PACKAGES python-dev git python-setuptools python-pip

RUN apt-get update && \
    apt-get install -y --no-install-recommends ${PACKAGES}

COPY bin/helloworld_check /usr/local/bin/
RUN chmod a+x /usr/local/bin/helloworld_check

CMD ["/bin/bash"]
