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

AZURE_TENANT_ID=d3d38dff-f85c-4026-842d-c215eb6b3560
AZURE_SUBSCRIPTION=Hi3G-Web-SE-Prod
AKS_CLUSTER_NAME=aks-webprod
AKS_RESOURCE_GROUP=rg-webprod-aks
    
echo $AZURE_TENANT_ID $AZURE_SUBSCRIPTION $AKS_CLUSTER_NAME $AKS_RESOURCE_GROUP $AKS_RESOURCE_GROUP $AKS_CLUSTER_NAME
az login --service-principal -u $USER -p $PASSWORD --tenant $AZURE_TENANT_ID
echo setting subscription $AZURE_SUBSCRIPTION
az account set --subscription $AZURE_SUBSCRIPTION
echo setting cluster to $AKS_CLUSTER_NAME in resource group $AKS_RESOURCE_GROUP
az aks get-credentials --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME