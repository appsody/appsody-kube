# Appsody on Kubernetes

This repository contains the artifacts to build an image on which you can run the Appsody CLI in a Kubernetes pod. The image includes the Appsody CLI, the [buildah](`quay.io/buildah/stable`) tool, and the `kubectl` command line.

### Building the image
This repo includes a `.travis.yml` file that builds and pushes the image to Docker Hub. However, if you prefer building the image manually, issue the following command:
`docker build -t appsody-k8s -f Dockerfile .`

### Running the image locally
If you want to run the image manually, issue the following command:
`docker run -it --privileged -v containers:/var/lib/containers <image-id> bash`
The image sets the `APPSODY_K8S_EXPERIMENTAL` environment variable which enables Appsody to be used with Buildah instead of Docker.

