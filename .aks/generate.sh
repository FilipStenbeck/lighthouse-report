#!/bin/sh

FROM=app.tmpl
TO=app.yaml

rm -rf app.yaml

APP_VERSION=$(cat ../package.json | jq .version | jq -r)
APP_NAME=$(cat ../package.json | jq .name | jq -r)


echo Generating $TO
export ENVIRONMENT=$1
export DOCKER_IMAGE=hi3gcontainerregistry.azurecr.io/$APP_NAME:$APP_VERSION
envsubst < $FROM >> $TO

echo Created manifest for $APP_NAME:$APP_VERSION
