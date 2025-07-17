# Projeto Docker - Calculadora K8s com helm

Este projeto utiliza Docker para orquestrar os containers do MySQL, backend e frontend, conectados em uma rede Docker customizada. 
Este projeto consiste em uma calculadora interativa. Ao inserir os números e selecionar as operações, o resultado é exibido ao pressionar o botão =. Além disso, todo o histórico de cálculos realizados é armazenado em um banco de dados, permitindo rastrear e consultar operações anteriores.

---

## Comandos para rodar os pods
### 1. Helm
```bash
helm lint .
helm install calculadora .
```

Acessar a calculadora via calculadora.k8s.local