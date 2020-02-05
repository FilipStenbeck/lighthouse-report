#!/bin/sh

set -e
set +x

if [ "$#" -ne 3 ]; then
    echo "Usage:"
    echo "./deploy ENVIRONMENT USERNAME PASSWORD"
    exit 1
fi

ENVIRONMENT=$1
USER=$2
PASSWORD=$3

BRANCH=$(git rev-parse --abbrev-ref HEAD)
ENV_VARIABLES="variables/$ENVIRONMENT.env.json"

export $(cat $ENV_VARIABLES | jq .general | jq -r 'to_entries|map("\(.key)=\(.value|tostring|split(" ")|join(" "))")|.[]')

echo $AZURE_TENANT_ID $AZURE_SUBSCRIPTION $AKS_CLUSTER_NAME $AKS_RESOURCE_GROUP $AKS_RESOURCE_GROUP $AKS_CLUSTER_NAME
az login --service-principal -u $USER -p $PASSWORD --tenant $AZURE_TENANT_ID
echo setting subscription $AZURE_SUBSCRIPTION
az account set --subscription $AZURE_SUBSCRIPTION
echo setting cluster to $AKS_CLUSTER_NAME in resource group $AKS_RESOURCE_GROUP
az aks get-credentials --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME