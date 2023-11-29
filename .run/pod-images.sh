#!/bin/bash
# Prints the pod name, image, and tag

pods=$(kubectl get pods -n=ktask -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | grep 'svc')

for pod in $pods; do
    printf "\nPod  : %s\n" "$pod"
    images=$(kubectl get pods -n=ktask $pod -o=jsonpath='{..image}' | \
    tr -s '[[:space:]]' '\n' | uniq)
    for image in $images; do
        printf "Image: %s\n" "$image"
    done
done