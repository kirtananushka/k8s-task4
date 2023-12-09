# Task 4

## 📀 Install release

```bash
  helm install music-service-release ../music-service 
```

## 🏥 Check probes

```bash
  ./check-probes.sh
```

## ➡️ Port forward for databases

```bash
  ./port-forward-db.sh
```

## 🖧 Start proxy

```bash
  kubectl proxy
```

## 🖥️ Run dashboard

```bash
  cmd.exe //c start chrome "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
```

## 🔼 Upgrade release

```bash
  helm upgrade music-service-release ../music-service
```

## 🗑️ Uninstall release

```bash
  helm uninstall music-service-release
```

## ⬇️ Scale down Ingress Controller

```bash
kubectl scale deployment -n ingress-nginx ingress-nginx-controller --replicas=0
```

## ⬆️ Scale up Ingress Controller

```bash
kubectl scale deployment -n ingress-nginx ingress-nginx-controller --replicas=1
```