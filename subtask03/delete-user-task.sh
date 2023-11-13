#!/bin/bash
# Deletes all user sask manifests

manifests=(
  "user-deployment.yaml"
  "user-pvc.yaml"
  "user-pv.yaml"
  "user-namespace.yaml"
)

for manifest in "${manifests[@]}"; do
  echo "Deleting $manifest..."
  kubectl delete -f "./$manifest"
done

echo
echo "All user manifests have been deleted."
echo
kubectl get pods -n=user-task