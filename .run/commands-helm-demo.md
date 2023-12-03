# Task 3 Subtask 1

## 📀 Install release

```bash
  helm install music-service-release ../music-service 
```

## 📊 Output information about the namespace and replicas

```bash
echo
for namespace in ktask dev; do
  for resourceType in deployments statefulsets; do
    kubectl get $resourceType -n $namespace -o jsonpath="{range .items[*]}{'$resourceType\t'}{.metadata.name}{'\tnamespace='}{.metadata.namespace}{'\t\treplicas='}{.spec.replicas}{'\n'}{end}"
  done
done | column -t
```

## 🗑️ Uninstall release

```bash
  helm uninstall music-service-release
```

## 🌐 Install release to `dev` namespace and decrease replicas to 1

```bash
  helm install music-service-release ../music-service \
    --set namespace=dev \
    --set resourceSvc.replicas=1 \
    --set songSvc.replicas=1
```

## 📊 Output information about the namespace and replicas

```bash
echo
for namespace in ktask dev; do
  for resourceType in deployments statefulsets; do
    kubectl get $resourceType -n $namespace -o jsonpath="{range .items[*]}{'$resourceType\t'}{.metadata.name}{'\tnamespace='}{.metadata.namespace}{'\t\treplicas='}{.spec.replicas}{'\n'}{end}"
  done
done | column -t
```

# Task 3 Subtask 2

## 🏷️ Get Labels

```bash
    for namespace in ktask dev; do
        labels=$(kubectl get configmap app-deployment-config -n "$namespace" -o jsonpath='{.metadata.labels}' 2>/dev/null)
        if [ -n "$labels" ]; then
        echo
        echo "$labels"
            date=$(echo "$labels" | jq -r '.date // "N/A"')
            version=$(echo "$labels" | jq -r '.version // "N/A"')
            echo "Date: $date"
            echo "Version: $version"
        fi
    done
```
