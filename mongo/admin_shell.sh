#!/bin/bash

docker run -it --network ${NETWORK} --rm mongo sh -c 'exec mongo "mongodb:27017/" -u "root" -p "${PASSWORD}" --authenticationDatabase "admin"'

