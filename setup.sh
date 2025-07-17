#!/bin/bash

# Verificar a branch atual do Git
echo "Verificando a branch do Git..."
git branch
git checkout helm

# Ativar o addon de Ingress no Minikube
echo "Ativando o addon de Ingress no Minikube..."
minikube addons enable ingress

# Abrir o dashboard do Minikube
echo "Abrindo o dashboard do Minikube..."
minikube dashboard &

# Rodar a aplicação com Helm
echo "Rodando a aplicação com Helm..."
cd calculadora-chart
helm install calculadora .


