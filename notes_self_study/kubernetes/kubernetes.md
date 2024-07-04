# Kubernetes

## Commands

- `kubectl get all` : view all resources within the kubernetes cluster in the current namespace
- `kubectl get all --all-namespaces` : view all resources within kubernetes clusters across all namespaces
- `kubectl apply -f <filename>.yaml` : create or update a resource in a kubernetes cluster defined in <filename>.yaml
- `kubectl apply -f .` : create or update resources in all yaml files in the current directory
- `kubectl describe pod <pod_name>` : view the description of a kubernetes pod
- `kubectl exec <pod_name>` : exec into a pod
- `kubectl -it exec <pod_name> sh` : exec into a pod interactively with sh. Type `exit` to terminate.
- `kubectl describe svc <service_name>` : view the description of a service
- `kubectl get pods` : get all pods
- `kubectl rollout status deploy <name>` : see status of rolling out
- `kubectl rollout history deploy <name>` : see history of revisions
- `kubectl rollout undo deploy <name>` : undo the deployment to the previous revision
- `kubectl rollout undo deploy <name> --to-revision=<revision>` : undo the deployment to a specific revision
- `kubectl get ns` : get all namespaces
- `kubectl get all -n <namespace>` : get resources from a specific namespace
- `kubectl delete all --all` : delete all resources from all yaml scripts in the current directory

## Types of services

- CusterIP: Accessible only within the cluster
- NodePort: Accessible from external ips
