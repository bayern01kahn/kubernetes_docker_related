
# The Basics
```

kubectl apply -f Infrastructure/redis/base/namespace.yaml
kubectl apply -f Infrastructure/redis/base/configmap.yaml
kubectl apply -f Infrastructure/redis/base/pvc.yaml
kubectl apply -f Infrastructure/redis/base/statefulset.yaml
kubectl apply -f Infrastructure/redis/base/svc.yaml
 
kubectl delete ns redis

```

# Kustomize

## Base
```
kubectl apply -k Infrastructure/redis/base

kubectl delete ns redis
```

## Overlays & Envs

```
kubectl apply -k Infrastructure/redis/env/prod

kubectl delete ns redis
```



## Test scripts

```shell
redis-cli
auth Hello1234!!!!
auth Hello4321
config get maxmemory
```

