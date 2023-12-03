# Task 3

## 📀 Install release

```bash
  helm install music-service-release ../music-service 
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

## 📃 List releases

```bash
  helm list
```

## 🏥 Check probes

```bash
  ./check-probes.sh
```

## ➡️ Port forward

```bash
  ./port-forward.sh
```

## 🖧 Start proxy

```bash
  kubectl proxy
```

## 🖥️ Run dashboard

```bash
  cmd.exe //c start chrome "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
```

## ⬆️ Upgrade release

```bash
  helm upgrade music-service-release ../music-service
```

## 🗑️ Uninstall release

```bash
  helm uninstall music-service-release
```

-----------------

## 🐛 Debug

### ❗ Install debug release

```bash
  helm install --debug --dry-run music-service-release ../music-service
```

### ⚙️ Upgrade debug release

```bash
  helm upgrade --debug --dry-run music-service-release ../short-service
```
  
-----------------

## 🏷️ Get Labels

```bash
  kubectl get configmap app-deployment-config -n ktask -o jsonpath='{.metadata.labels}'
```