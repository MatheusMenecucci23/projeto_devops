#!/bin/bash

# Verificar a branch atual do Git
echo "Verificando a branch do Git..."
git branch
git checkout helm

# Iniciar o Minikube
echo "Iniciando o Minikube..."
minikube start

# Ativar o addon de Ingress no Minikube
echo "Ativando o addon de Ingress no Minikube..."
minikube addons enable ingress

# Abrir o dashboard do Minikube
echo "Abrindo o dashboard do Minikube..."
minikube dashboard &

# Modificar o arquivo /etc/hosts
echo "Modificando o arquivo /etc/hosts..."
sudo bash -c 'echo "192.168.49.2  k8s.local" >> /etc/hosts'
sudo bash -c 'echo "192.168.49.2  backend.k8s.local" >> /etc/hosts'

# Rodar a aplicação com Helm
echo "Rodando a aplicação com Helm..."
cd calculadora-chart
helm install calculadora .


