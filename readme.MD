# Projeto Docker - Calculadora com Helm

Este projeto utiliza Docker, Kubernetes e Helm. 
Este projeto consiste em uma calculadora interativa. Ao inserir os números e selecionar as operações, o resultado é exibido ao pressionar o botão =. Além disso, todo o histórico de cálculos realizados é armazenado em um banco de dados, permitindo rastrear e consultar operações anteriores.

---
# Projeto Docker - Calculadora Parte final 
Utilizando Kubernets(K8S) - Minikube

## Startar Minikube
```bash
Minikube start
minikube addons enable
minikube addons enable ingress
Minikube dashboard
```

## Modifique o arquivo host
```bash
sudo nano /etc/hosts
```

## Adicione essas linhas
```bash
192.168.49.2  k8s.local
192.168.49.2  backend.k8s.local
```

## Comandos para rodar a aplicação
### 1. Helm
```bash
helm lint .
helm install calculadora .
```

## Criar banco de dados
```bash
kubectl get pods
kubectl exec -it <name-do-pod> -- bin/bash

mysql -u root -p
Criar o arquivo do init.sql
```