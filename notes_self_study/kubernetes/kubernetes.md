# Kubernetes

## Commands

- `kubectl get all` : view all resources within the kubernetes cluster in the current namespace
- `kubectl get all --all-namespaces` : view all resources within kubernetes clusters across all namespaces
- `kubectl apply -f <filename>.yaml` : create or update a resource in a kubernetes cluster defined in <filename>.yaml
- `kubectl describe pod <pod_name>` : view the description of a kubernetes pod
- `kubectl exec <pod_name>` : exec into a pod
- `kubectl -it exec <pod_name> sh` : exec into a pod interactively with sh. Type `exit` to terminate.
- `kubectl describe service <service_name>` : view the description of a service
- `kubetcl get pods` : get all pods 

## Types of services

- CusterIP: Accessible only within the cluster
- NodePort: Accessible from external ips
