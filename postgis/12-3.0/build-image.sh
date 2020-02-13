#!/bin/bash

VERSIONS=3.0
REPO_NAME=fzioti
IMAGE_NAME=postgis

echo ""

echo -e "\nBuild docker PostgreSQL 12.1 PostGIS 3.0 image\n"
docker build -t $REPO_NAME/$IMAGE_NAME:$VERSIONS .

echo ""
