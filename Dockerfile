# Latest buildah is buggy use v1.9.0 until this is resolved:
# https://github.com/containers/buildah/issues/1821
FROM quay.io/buildah/stable:v1.9.0
RUN yum -y install wget
# Matching appsody binary does not exist in upstream.
# Provide the proper version once it is available.
ARG CLI_VERSION
ARG CONTROLLER_BASE_URL
ENV KUBE_LATEST_VERSION="v1.11.1"
RUN wget https://github.com/appsody/appsody/releases/download/${CLI_VERSION}/appsody-${CLI_VERSION}-1.x86_64.rpm
RUN yum localinstall -y ./appsody-${CLI_VERSION}-1.x86_64.rpm
RUN wget https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl
RUN mv ./kubectl /usr/local/bin
RUN chmod 755 /usr/local/bin/kubectl
RUN wget ${CONTROLLER_BASE_URL}/appsody-controller
RUN mv ./appsody-controller /tmp/appsody-controller
RUN chmod 755 /tmp/appsody-controller
COPY ./appsody-setup.sh /tmp/appsody-setup.sh
RUN chmod 755 /tmp/appsody-setup.sh