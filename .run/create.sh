#!/bin/bash
# Creates all manifests using kustomization.yaml

echo "Applying kustomization.yaml to create all manifests..."
echo

kubectl apply -k ../resources

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