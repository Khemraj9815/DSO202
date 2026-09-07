## DSO202 Assignment 1: Three-Tier Application Deployment on Kubernetes Cluster

### Aims/Objectives



K8s objects that helps in scheduling and running the Pods are:
- scheduler: Schedules the Pods to run on the available nodes based on the resources.
- controller-manager: Mantain the desired state of the cluster by managing the lifecycle of the pods and other objects(deployments, services, etc).
- kublet: It is responsible to start/stop the containers in the pods.
- Container runtime: It is responsible for running the containers in the pods.

To expose the presentation tier to the internet, API server will be used to create a Service of type LoadBalancer, which will provide an external IP address for accessing the frontend. The Service will route traffic to the Pods in the presentation tier. Deployment will be used to manage the Pods, ensuring that the desired number of replicas are running and automatically replacing any failed Pods.

Application tier will be exposed to the presentation tier using a Service of type ClusterIP, which will provide an internal IP address for communication between the two tiers. Deployment will be used to manage the Pods in the application tier, ensuring that the desired number of replicas are running and automatically replacing any failed Pods.

Data tier will be exposed to the application tier using a Service of type ClusterIP, which will provide an internal IP address for communication between the two tiers. Deployment will be used to manage the Pods in the data tier, ensuring that the desired number of replicas are running and automatically replacing any failed Pods.

## 🛠️ Task 2: Configuration, Secrets, and Security Architecture

### 1. Configuration Matrix (ConfigMap & Secrets)
To decouple configuration from application code, the environment setup is divided cleanly between non-sensitive properties and access credentials:

*   **ConfigMap (`app-config`)**: Manages structural environment paths, ports, and domains including `DB_HOST`, `DB_PORT`, `DB_NAME`, `APP_PORT`, `CORS_ORIGIN`, `POSTGRES_DB`, and `BACKEND_URL`.
*   **Secret (`db-credentials`)**: Restricts access credentials including `DB_USER`, `DB_PASSWORD`, `POSTGRES_USER`, and `POSTGRES_PASSWORD`.

### Kubernetes Secrets Encoding vs. Encryption
Per the explicit requirements of Section 1.2.5, it is critical to highlight that standard **Kubernetes Secrets are only base64-encoded, not encrypted at rest by default**. 

*   **The Risk**: Base64 is a simple text-obfuscation mechanism, not a secure encryption algorithm. Any user or attacker with access to the cluster's `etcd` database, or a developer with basic `kubectl get secret -o yaml` read permissions, can instantaneously decode the secrets back into plain-text by executing a simple translation command (e.g., `echo "ZGJ1c2Vy" | base64 --decode`).
*   **Production Remediation**: In a true enterprise environment, this out-of-the-box behavior must be supplemented by real cryptographic systems. Production clusters implement automated Key Management Services (KMS) plugins, cloud-managed secret vaults (like AWS Secrets Manager or HashiCorp Vault), or GitOps-friendly sealing layers (like Bitnami Sealed Secrets). 
*   **Assignment Scope**: Implementing actual encryption layers falls strictly outside the operational configuration scope of this assignment; this explicit notation satisfies the architectural documentation requirement.


**CRUD Operations**

![alt text](assets/1.png)

![alt text](assets/2.png)

![alt text](assets/3.png)



