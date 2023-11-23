#!/bin/bash
# Deletes all manifests using kustomization.yaml

echo "Deleting all manifests using kustomization.yaml..."
echo

kubectl delete -k ../resources

echo
echo "All manifests have been deleted."
echo
kubectl get pods -n=ktask