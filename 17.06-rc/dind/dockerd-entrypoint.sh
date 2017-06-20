#!/bin/sh
set -e

dockerd \
		--host=unix:///var/run/docker.sock \
		--host=tcp://0.0.0.0:2375 \
		--insecure-registry 10.0.0.0/8 \
		--storage-driver=vfs &

wait-for-it.sh 0.0.0.0:2375
$@
