# Kubernetes manifests (PE2)

```
k8s/
  frontend/   deployment.yaml  service.yaml
  backend/    deployment.yaml  service.yaml  configmap.yaml
  database/   deployment.yaml  service.yaml  secret.example.yaml
```

`secret.example.yaml` bevat **voorbeeldwaarden** en wordt gecommit; je echte `secret.yaml` staat in `.gitignore`.
