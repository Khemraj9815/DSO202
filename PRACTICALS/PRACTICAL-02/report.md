## Implementing Persistent Storage for a Stateful Application in Kubernetes 

**Aim/Objective:** 



StatefulSet will have a fixed name, a fixed DNS record, and its own volume that gets connected to it when restarted.

Volume: made available to the Pod.
- It is declared in the Pod specification
- and mounted at a path in a container at a path.

emptyDir: Temporary directory
- created when a Pod is assigned to a Node
- exists as long as that Pod is running on that Node

hostPath: Pre-existing file or directory on the host machine is exposed to the Pod.

PersistentVolume (PV): A piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.

PersistentVolumeClaim (PVC): A request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources.

add note here

--- 


