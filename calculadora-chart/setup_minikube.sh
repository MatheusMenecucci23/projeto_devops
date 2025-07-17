#!/bin/bash

# --- Minikube Setup ---
minikube start

minikube addons enable ingress


minikube dashboard &

# --- Kubernetes Pod

kubectl get pods



# --- MySQL 
echo "mysql -u root -p"

# --- Helm Commands ---
helm lint .

helm install calculadora .

echo "Script finished!"