# Projeto Docker - Calculadora com Helm

Este projeto utiliza Docker, Kubernetes e Helm. 
Este projeto consiste em uma calculadora interativa. Ao inserir os números e selecionar as operações, o resultado é exibido ao pressionar o botão =. Além disso, todo o histórico de cálculos realizados é armazenado em um banco de dados, permitindo rastrear e consultar operações anteriores.

---
# Projeto Docker - Calculadora Parte final 
Utilizando Kubernets(K8S) - Minikube

### 1. Rode
```bash
chmod +x setup.sh
./setup.sh
```

### 2. Criar banco de dados
```bash
kubectl get pods
kubectl exec -it <name-do-pod> -- bin/bash

mysql -u root -p

CREATE DATABASE IF NOT EXISTS calculadora_db;
USE calculadora_db;

CREATE TABLE IF NOT EXISTS history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    expression VARCHAR(255) NOT NULL,
    result DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Acesse aplicação via http://k8s.local/

```
### Rodar aplicação sem o script
## Verifique a branch
```bash
git branch
git checkout helm
```

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

## Comandos para rodar a aplicação.
### 1. Helm
```bash
cd calculadora-chart
helm install calculadora .
```

### 2. Criar banco de dados
```bash
kubectl get pods
kubectl exec -it <name-do-pod> -- bin/bash

mysql -u root -p

CREATE DATABASE IF NOT EXISTS calculadora_db;
USE calculadora_db;

CREATE TABLE IF NOT EXISTS history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    expression VARCHAR(255) NOT NULL,
    result DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


```