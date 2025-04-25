#!/bin/bash

echo "criando as imagens..."
docker build -t henrique-2025/projeto-backend:1.0 backend/.
docker build -t henrique-2025/projeto-database:1.0 database/.

echo "enviando para o git hub as imagens..."
docker push henrique-2025/projeto-backend:1.0
docker push henrique-2025/projeto-database:1.0

echo "Criando serviços do cluster..."
kubectl apply -f ./services.yml

echo "Criando deployments..."
kubectl apply -f ./deployment.yml