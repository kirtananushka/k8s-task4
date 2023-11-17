#!/bin/bash
# Creates all manifests

manifests=(
  "namespace.yaml"
  "db-secret.yaml"
  "config-map.yaml"
  "postgres-service.yaml"
  "song-svc-service.yaml"
  "song-svc-deployment.yaml"
  "postgres-statefulset.yaml"
  "resource-svc-service.yaml"
  "resource-svc-deployment.yaml"
)

for manifest in "${manifests[@]}"; do
  echo "Creating $manifest..."
  kubectl create -f "../resources/$manifest"
done

echo
echo "All manifests have been created."
echo

NAMESPACE="ktask"

# Loop until all pods are in Running status
while true; do
  # Get the total number of pods and the number of Running pods
  TOTAL_PODS=$(kubectl get pods -n="$NAMESPACE" -o json | jq '.items | length')
  RUNNING_PODS=$(kubectl get pods -n="$NAMESPACE" -o json | jq '[.items[] | select(.status.phase=="Running")] | length')

  # Check if all pods are Running
  if [[ $RUNNING_PODS -eq $TOTAL_PODS ]]; then
    echo "All pods are running."
    break
  else
    echo "Waiting for all pods to be running... ($RUNNING_PODS/$TOTAL_PODS)"
    sleep 1
  fi
done

echo

kubectl get pods -n=ktask
