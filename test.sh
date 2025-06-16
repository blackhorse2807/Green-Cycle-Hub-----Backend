#!/bin/bash

docker build -t backend .
docker run --env-file .env -p 8000:8000 backend