## Development of Appsody as a standalone project has ended, but the core technologies of Appsody have been merged with odo to create odo 2.0! See our [blog post](https://appsody.dev/blogs/DevelopmentEnded) for more details!

# Appsody on Kubernetes

This repository contains the artifacts needed to build an image on which you can run the Appsody CLI in a Kubernetes pod. The image includes the Appsody CLI, the [buildah](`quay.io/buildah/stable`) tool, and the `kubectl` command line.

### Building the image
This repo includes a `.travis.yml` file that builds and pushes the image to DockerHub using Travis CI. 

To build the image manually without using Travis CI, use the following command:

```sh
docker build -t appsody-k8s -f Dockerfile .
```

**Note:** This is an experimental image, used by the Appsody team, solely for the purpose of testing. Images on DockerHub may be outdated.

### Running the image locally
To run the image manually, use the following command:

```sh
docker run -it --privileged -v containers:/var/lib/containers <image-id> bash
```

`APPSODY_K8S_EXPERIMENTAL=TRUE` is exported to enable Appsody to be used with Buildah instead of Docker.
