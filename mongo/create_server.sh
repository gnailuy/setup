#!/bin/bash

docker run --name mongodb --network ${NETWORK} -d -p 27017:27017 -v /home/${USER}/mongodb/data:/data/db mongo --auth

