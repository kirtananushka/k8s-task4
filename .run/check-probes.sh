#!/bin/bash

NAMESPACES=("ktask")
RESOURCES=("resource-svc" "song-svc" "resource-db" "song-db")

# Check the probe status for each pod
check_probes() {
    local namespace=$1
    local resource=$2
    echo
    echo "Checking probes for $resource:"
    for pod in $(kubectl get pods -n $namespace -l app=$resource -o jsonpath="{.items[*].metadata.name}")
    do
        probe_status=$(kubectl get pod $pod -n $namespace -o jsonpath="{.status.containerStatuses[*].state}")
        echo "Pod: $pod, Probe Status: $probe_status"
    done
}

# Iterate over the resources and check probes
for namespace in "${NAMESPACES[@]}"
do
    for resource in "${RESOURCES[@]}"
    do
        check_probes $namespace $resource
    done
done
