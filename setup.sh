#!/bin/bash
echo "Minikube Start..."
minikube start

# Verificar a branch atual do Git
echo "Verificando a branch do Git..."
git branch
git checkout helm

# Ativar o addon de Ingress no Minikube
echo "Ativando o addon de Ingress no Minikube..."
minikube addons enable metrics-server
minikube addons enable ingress

# Rodar a aplicação com Helm
echo "Rodando a aplicação com Helm..."
cd calculadora-chart
helm install calculadora .

# Abrir o dashboard do Minikube
echo "Abrindo o dashboard do Minikube..."
minikube dashboard &

