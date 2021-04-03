# fineract-build for raspberry-pi kubernetes cluster

The apache fineract project builds docker images but images for the armv7 and arm64/v8 platform is not availble.
Support for additional architecture can be made available using a multi-stage build that utilizes the
docker buildx system.

This repo contains only the build scripts. For details of fineract please see the apache
[fineract](https://github.com/apache/fineract) project.

## Building locally

Log into docker hub and then issue the docker buildx command

	docker login
	docker buildx build -t iconsent/fineract:latest . --push
