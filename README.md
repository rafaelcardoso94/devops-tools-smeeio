# smee-io

Helm chart e Dockerfile para implantar um **forwarder de webhooks** baseado no [Smee.io](https://smee.io).  
Ele atua como um proxy entre o **GitHub** e o **ArgoCD**, recebendo eventos de webhooks e encaminhando-os de forma segura e confiável para o destino configurado.

## 📦 Estrutura do repositório

```
├── Dockerfile # Criação da imagem do forwarder
├── README.md # Documentação do projeto
└── helm
├── Chart.yaml # Metadados do Helm chart
├── template
│ └── deployment.yaml # Template do Deployment Kubernetes
└── values
└── values.yaml # Valores configuráveis do chart
```

## 🚀 Objetivo

O objetivo deste projeto é facilitar a implantação de um serviço **Smee.io forwarder** dentro de um cluster Kubernetes, permitindo:
- Encaminhar webhooks do GitHub para serviços internos, como o ArgoCD;
- Garantir comunicação segura, sem expor endpoints públicos do cluster;
- Ter deploy automatizado e versionado via Helm.

## 🧰 Pré-requisitos

- [Docker](https://docs.docker.com/)
- [Helm](https://helm.sh/)
- [Kubernetes](https://kubernetes.io/) cluster ativo
- Uma URL de canal ativa no [Smee.io](https://smee.io)

## ⚙️ Configuração

Edite o arquivo `helm/values/values.yaml` conforme necessário:

```yaml
image:
  repository: your-registry/smee-io
  tag: latest

smee:
  source: https://smee.io/YOUR_CHANNEL_ID
  target: https://argocd.example.com/api/webhook
  interval: 5000
```

## 🏗️ Instalação com Helm
```
cd helm
helm install smee-io .
kubectl get pods -l app=smee-io
```
## 🐳 Build da imagem Docker
```
docker build -t your-registry/smee-io:latest .
docker push your-registry/smee-io:latest
```

## 📖 Exemplo de uso

Esse projeto é ideal para cenários em que o GitHub Webhook precisa acionar o ArgoCD dentro de um cluster privado.

Fluxo:

- GitHub envia o webhook para o canal Smee.io.
- O forwarder (este serviço) recebe o evento e o repassa para o ArgoCD interno.
- O ArgoCD sincroniza o repositório automaticamente.

## 🧑‍💻 Autor
Rafael Silva