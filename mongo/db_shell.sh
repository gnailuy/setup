#!/bin/bash

docker run -it --network ${NETWORK} --rm mongo sh -c 'exec mongo "mongodb:27017/${DBNAME}" -u "${USER}" -p "${PASSWORD}" --authenticationDatabase "${DBNAME}"'

