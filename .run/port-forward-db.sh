#!/bin/bash

# Port forwarding for resource-svc-db-0
echo "Port forwarding for resource-svc-db-0 on 5432:5432"
kubectl port-forward resource-svc-db-0 5432:5432 -n=ktask &

# Port forwarding for song-svc-db-0
echo "Port forwarding for song-svc-db-0 on 5433:5432"
kubectl port-forward song-svc-db-0 5433:5432 -n=ktask &

wait