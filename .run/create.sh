#!/bin/bash
# Creates all manifests using kustomization.yaml

echo "Applying kustomization.yaml to create all manifests..."
echo

kubectl apply -k ../resources

echo
echo "All manifests have been created."
echo

NAMESPACE="ktask"
TOTAL_PODS=$(kubectl get pods -n="$NAMESPACE" -o json | jq '.items | length')

# Loop until all pods are in Running status
while true; do
  RUNNING_PODS=$(kubectl get pods -n="$NAMESPACE" -o json | jq '[.items[] | select(.status.phase=="Running")] | length')

    if [[ $RUNNING_PODS -eq $TOTAL_PODS ]]; then
    echo "Waiting for all pods to be running... ($TOTAL_PODS/$TOTAL_PODS)"
    echo "All pods are running."
    break
  else
    echo "Waiting for all pods to be running... ($RUNNING_PODS/$TOTAL_PODS)"
    sleep 1
  fi
done

echo
kubectl get pods -n=ktask
echo

# Loop until all pods are Ready
while true; do
  READY_PODS=$(kubectl get pods -n="$NAMESPACE" -o json | jq '[.items[] | select(.status.conditions[] | select(.type=="Ready" and .status=="True"))] | length')

  if [[ $READY_PODS -eq $TOTAL_PODS ]]; then
    echo "Waiting for all pods to be ready... ($TOTAL_PODS/$TOTAL_PODS)"
    echo "All pods are ready."
    break
  else
    echo "Waiting for all pods to be ready... ($READY_PODS/$TOTAL_PODS)"
    sleep 1
  fi
done

echo

kubectl get pods -n=ktask