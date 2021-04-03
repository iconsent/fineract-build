# fineract-build for raspberry-pi kubernetes cluster

The apache fineract project builds docker images but images for the armv7 and arm64/v8 platform is not availble.
Support for additional architecture can be made available using a multi-stage build that utilizes the
docker buildx system.

This repo contains only the build scripts. For details of fineract please see the apache
[fineract](https://github.com/apache/fineract) project.

The container image is available at (docker hub)[https://hub.docker.com/r/iconsent/fineract]).

Note: The CI process is currently manual, there is no automated webhook for trigerring the build when apache/fineract 
project is updated. Unless someone asks for it, the schedular will not be added.

## Building locally

Log into docker hub and then issue the docker buildx command

	docker login
	docker buildx build --platform linux/arm64 -t <your docker user id>/fineract:latest . --push

## References

1. [Docker buildx blog on docker.com](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/)
2. [Apache Fineract](http://fineract.apache.org/)
