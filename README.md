# fluent-operator-development

A ready-to-use containerized development environment for building and testing [fluent-operator](https://github.com/fluent/fluent-operator) inside a Kubernetes pod. All required dependencies are included, so you can quickly spin up a nested Kubernetes cluster and start developing or testing fluent-operator within Kubernetes itself.

---

## Prerequisites

- Access to a Kubernetes cluster (e.g., Minikube, EKS, GKE, etc.)
- [`kubectl`](https://kubernetes.io/docs/tasks/tools/) configured for your cluster

---

## Getting Started

### 1. Deploy the Development Pod

Apply the deployment manifest to your Kubernetes cluster:

```sh
kubectl apply -f fluent-operator-deployment.yaml
```

### 2. Access the Development Container

Find the pod name:

```sh
kubectl get pods -l app=anson-fluent-operator-test
```

Enter the main development container:

```sh
kubectl exec -it <pod-name> -c fluent-operator-development -- /bin/bash
```

### 3. Create a Nested Kubernetes Cluster

Inside the container, run:

```sh
kind create cluster
```

This launches a nested Kubernetes cluster using [kind](https://kind.sigs.k8s.io/).

### 4. Develop or Test fluent-operator

Begin your development or testing work inside this isolated environment. All necessary tools (Docker, kind, etc.) are pre-installed.

---

## Folder Structure

- `Dockerfile` – Defines the development environment image and dependencies.
- `fluent-operator-deployment.yaml` – Kubernetes manifest for the development pod and Docker-in-Docker (dind) sidecar.

---

## Advanced

- The pod includes a Docker-in-Docker (dind) sidecar, enabling Docker commands within the development container.
- Shared volumes provide persistent workspace and Docker socket access.
- You can customize the `Dockerfile` to add additional tools or dependencies as needed.

---

## Cleanup

To remove the development pod:

```sh
kubectl delete -f fluent-operator-deployment.yaml
```

---

## License

[MIT License](LICENSE)  
_Update this section if your repo uses a different license._