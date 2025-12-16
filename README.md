# python-web-app

### Persistent Storage (PVC)
This app uses a PersistentVolumeClaim to persist data across pod restarts.

### 📦 Persistent Storage
The application uses a PersistentVolumeClaim to ensure data durability.

Key highlights:
- 8Gi storage request
- ReadWriteOnce access mode
- Environment-based volume selection

📄 Full configuration: [mutation-storage-class.yml](mutation/mutation-storage-class.yml)

### ⚖️ Resource Quotas
ResourceQuota is used to prevent excessive CPU and memory usage within the namespace.

Limits:
- CPU: 1 core
- Memory: 2Gi

📄 Full configuration: [resourcequota.yml](validation/resourcequota.yml)

Kubernetes Deployment Configuration

##This application is deployed to Kubernetes using a Deployment resource with clearly defined runtime behavior, resource management, and container configuration.

Container Runtime

Image: richard92/my-python-app:latest

Pull Policy: Always (ensures the latest image is always used)

Container Port: 5000

Entrypoint Override:
/bin/sh -c "while true; do echo hello; sleep 10; done"
This was used to validate container startup, logging, and pod lifecycle during testing.
Resource Management

##The deployment enforces resource requests and limits to ensure predictable scheduling and prevent resource starvation:

Resource	 Requests	 Limits
CPU	         1m	      500m
Memory	     2Gi	    10Gi

Requests guarantee minimum resources for scheduling

Limits protect the cluster from overconsumption

Works in conjunction with ResourceQuota for namespace-level enforcement
