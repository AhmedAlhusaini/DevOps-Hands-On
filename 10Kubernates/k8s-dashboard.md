### 0. Install 
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update

helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
kubectl get pods -n kubernetes-dashboard
kubectl get svc -n kubernetes-dashboard


#### To Unistall 
helm uninstall kubernetes-dashboard -n kubernetes-dashboard
kubectl delete namespace kubernetes-dashboard

Then 
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard --wait

*************************************************************************************************
*** PLEASE BE PATIENT: Kubernetes Dashboard may need a few minutes to get up and become ready ***
*************************************************************************************************

Congratulations! You have just installed Kubernetes Dashboard in your cluster.

To access Dashboard run:
  kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443

NOTE: In case port-forward command does not work, make sure that kong service name is correct.
      Check the services in Kubernetes Dashboard namespace using:
        kubectl -n kubernetes-dashboard get svc

Dashboard will be available at:
  https://localhost:8443

kubectl get sa -n kubernetes-dashboard
PS C:\Users\ahmed.elhossainy> kubectl get sa -n kubernetes-dashboard
NAME                                   SECRETS   AGE
admin-user                             0         5d22h
default                                0         6d14h
kubernetes-dashboard-api               0         6d14h
kubernetes-dashboard-kong              0         6d14h
kubernetes-dashboard-metrics-scraper   0         6d14h
kubernetes-dashboard-web               0         6d14h

kubectl -n kubernetes-dashboard create token <NAME_FROM_LIST>

# 1. Create the ServiceAccount
kubectl create serviceaccount admin-user -n kubernetes-dashboard

# 2. Give it Cluster Admin rights
kubectl create clusterrolebinding admin-user-binding --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:admin-user

# 3. Get your new token
kubectl -n kubernetes-dashboard create token admin-user



  
#### How To Expose It 
From Begining :

helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard --set service.type=NodePort
#OR
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard  --create-namespace  --namespace kubernetes-dashboard --set service.type=NodePort  --set service.nodePort=32000

<!-- 
3. Security Reminder
Exposing the dashboard permanently means it’s reachable without kubectl proxy. Since the dashboard has cluster‑wide visibility, you should:

Use RBAC and tokens for authentication.

Restrict access via firewall or ingress rules.

Avoid exposing it directly to the public internet unless secured with TLS and proper auth -->

First Approach: 

kubectl proxy --> http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard-web:/proxy/

OR 


kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard-web 8443:443
kubectl port-forward -n kubernetes-dashboard deployment/kubernetes-dashboard-web 8443:443

#Safe 

kubectl port-forward -n kubernetes-dashboard deployment/kubernetes-dashboard-web 8443:8000
Then Open 
https://localhost:8443

kubectl -n kubernetes-dashboard create token kubernetes-dashboard

You may hit another common "New Dashboard" snag. In the latest versions (v3.0+), the ServiceAccount is often renamed or tied to a specific component.

The error serviceaccounts "kubernetes-dashboard" not found means that specific name doesn't exist in your -n kubernetes-dashboard namespace.

#Better 
kubectl get sa -n kubernetes-dashboard
PS C:\Users\ahmed.elhossainy> kubectl get sa -n kubernetes-dashboard
NAME                                   SECRETS   AGE
admin-user                             0         5d22h
default                                0         6d14h
kubernetes-dashboard-api               0         6d14h
kubernetes-dashboard-kong              0         6d14h
kubernetes-dashboard-metrics-scraper   0         6d14h
kubernetes-dashboard-web               0         6d14h

kubectl -n kubernetes-dashboard create token <NAME_FROM_LIST>

So,
kubectl -n kubernetes-dashboard create token admin-user 
#kubectl create clusterrolebinding admin-user-binding --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:admin-user
kubectl -n kubernetes-dashboard create token default
kubectl -n kubernetes-dashboard create token kubernetes-dashboard-web 


<!-- 🔑 Key Points
Not permanent: As soon as you close the terminal or stop the command, the port‑forward stops.

On demand: You use it when you need quick access to a pod or service from your local machine.

No cluster change: Port‑forward doesn’t modify the service type or expose it externally; it’s just a tunnel created by kubectl.

Good for testing/dev: Ideal for dashboards, debugging, or accessing internal services without changing cluster networking.

⚙️ Alternatives if you want always‑on access
Change Service type to NodePort → Exposes the service on a static port across all nodes.

Use LoadBalancer (if your environment supports it) → Gets an external IP.

Ingress Controller → More production‑ready, lets you expose multiple services under a single domain with TLS. -->





Second Approach:

kubectl -n kubernetes-dashboard edit svc kubernetes-dashboard-web
```
spec:
  type: NodePort
#OR
spec:
  type: LoadBalancer

```

### 1. Verify the Service
Run:
```powershell
kubectl get svc -n kubernetes-dashboard
```
This will show you if there’s a **Service** exposing the dashboard. By default, the dashboard is usually exposed as a ClusterIP service (internal only).

---

### 2. Access Methods
Depending on how you installed it, there are a few ways to reach it:

- **kubectl proxy (most common for local access):**
  ```powershell
  kubectl proxy
  ```
  Then open:
  ```
  http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard-web:/proxy/
  ```
  This works if the dashboard service is ClusterIP.

- **NodePort Service (if configured):**
  If the service type is `NodePort`, you’ll see a port (e.g., 30000–32767). Then you can access:
  ```
  http://<NodeIP>:<NodePort>
  ```

- **LoadBalancer Service (cloud environments):**
  If the service type is `LoadBalancer`, you’ll get an external IP. Then you can access:
  ```
  http://<ExternalIP>:<Port>
  ```

---

### 3. Check Deployment
You already ran:
```powershell
kubectl get deploy -n kubernetes-dashboard
```
This confirms the dashboard components are deployed. If you see them, it’s definitely installed.

---

### 4. Authentication
The dashboard requires a token. To get one:
```powershell
kubectl -n kubernetes-dashboard create token kubernetes-dashboard
```
Copy that token and paste it into the login screen when you access the dashboard.

---

### 5. Quick Troubleshooting
- If you can’t find the service, check:
  ```powershell
  kubectl describe pod <pod-name> -n kubernetes-dashboard
  ```
  to see logs and confirm it’s healthy.
- If you installed via `kubectl apply -f recommended.yaml`, the default setup is ClusterIP + `kubectl proxy`.