# Task 2

## Create all manifests
```bash
./create.sh
```

## Delete all manifests
```bash
./delete.sh
```

## Check probes
```bash
./check-probes.sh
```

## Port forward
```bash
./port-forward.sh
```

## Apply deployment manifests
```bash
kubectl apply -f ..//resources/resource-svc-deployment.yaml \
              -f ..//resources/song-svc-deployment.yaml
```

## Print the pod name, image, and tag
```bash
./pod-images.sh
```

## Set new image version
```bash
kubectl set image deployment/resource-svc -n=ktask resource-svc=irrisorrimus/resource-svc:v1.2
kubectl set image deployment/song-svc     -n=ktask song-svc=irrisorrimus/song-svc:v1.2
```

## Check rollout history
```bash
kubectl rollout history deployment/resource-svc -n=ktask
kubectl rollout history deployment/song-svc -n=ktask
```

## Rollback to a previous version
```bash
kubectl rollout undo deployment/resource-svc -n=ktask
kubectl rollout undo deployment/song-svc -n=ktask
```

<hr>

## Start proxy
```bash
    kubectl proxy
```

## Run dashboard
```bash
    cmd.exe //c start chrome "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
```


