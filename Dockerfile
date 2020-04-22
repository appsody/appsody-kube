FROM appsody/appsody-buildah:0.6.0-buildah1.9.0
ENV APPSODY_K8S_EXPERIMENTAL=TRUE
ENV KUBE_LATEST_VERSION="v1.11.1"
RUN wget https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl
RUN mv ./kubectl /usr/local/bin
RUN chmod 755 /usr/local/bin/kubectl
COPY ./appsody-setup.sh /tmp/appsody-setup.sh
RUN chmod 755 /tmp/appsody-setup.sh
