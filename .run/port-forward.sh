#!/bin/bash

# Port forwarding for resource-db-0
echo "Port forwarding for resource-db-0 on 5432:5432"
kubectl port-forward resource-db-0 5432:5432 -n=ktask &

# Port forwarding for song-db-0
echo "Port forwarding for song-db-0 on 5433:5432"
kubectl port-forward song-db-0 5433:5432 -n=ktask &

# resource-svc
resource_svc_pod=$(kubectl get pods -l app=resource-svc -n=ktask -o jsonpath="{.items[0].metadata.name}")
echo "Port forwarding for $resource_svc_pod on 8071:8080"
kubectl port-forward "$resource_svc_pod" 8071:8080 -n=ktask &

# song-svc
song_svc_pod=$(kubectl get pods -l app=song-svc -n=ktask -o jsonpath="{.items[0].metadata.name}")
echo "Port forwarding for $song_svc_pod on 8072:8080"
kubectl port-forward "$song_svc_pod" 8072:8080 -n=ktask &

wait