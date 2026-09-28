## DSO202 Assignment 2: Three-Tier Application Deployment on Kubernetes Cluster using StatefulSet and Ingress

**Aims/Objectives**
- To deploy a three-tier application on a k8s cluster using StatefulSet for data persistence
- Use Ingress to expose the application to external traffic

What is StatefulSet?
It is kubernetes resources.
- StatefulSets provide the following features:
  - Stable, unique network identifiers for each pod
  - Persistent storage using PersistentVolumeClaims (PVCs)

What is Ingress?
- Ingress is a Kubernetes resource that manages external access to services within a cluster, typically HTTP
- Ingress can provide load balancing, SSL termination, and name-based virtual hosting.

What is Traefik?
- Traefik is a modern HTTP reverse proxy and load balancer written in Go.
- Strength of Traefik is that it automatically discovers the services and route the traffic to the appropriate service without manual intervention.

There are alternative to Traefik like Nginx, HAProxy, Envoy, etc.


