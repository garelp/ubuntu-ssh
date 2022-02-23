#Dockerfile vars
ubuntu_version=bionic
my_version=2.0

#vars
IMAGENAME=ubuntu-ssh
REPO=registry-hom.gem.myengie.com/library
MY_VERSION=${my_version}
IMAGEFULLNAME=${REPO}/${IMAGENAME}:${MY_VERSION}

.PHONY: help build push all

help:
	    @echo "Makefile arguments:"
	    @echo ""
	    @echo "ubuntu-version - Ubuntu Version"
	    @echo "my_version - my image version"
	    @echo ""
	    @echo "Makefile commands:"
	    @echo "build"
	    @echo "push"
	    @echo "all"

.DEFAULT_GOAL := all

build:
	    @docker build --pull --build-arg UBUNTU_VERSION=${ubuntu_version} -t ${IMAGEFULLNAME} .

push:
	    @docker push ${IMAGEFULLNAME}

all: build push
