#!/bin/sh

set -e
set +x

echo
echo "--- DRY RUN ---"
kubectl apply -f app.yaml --dry-run
echo
echo "--- DEPLOY RUN ---"
kubectl apply -f app.yaml 
