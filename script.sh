#!/bin/bash

echo "criando as imagens..."
docker build -t henriquebr/projeto-backend:1.0 backend/.
docker build -t henriquebr/projeto-database:1.0 database/.

echo "enviando para o git hub as imagens..."
docker push henriquebr/projeto-backend:1.0
docker push henriquebr/projeto-database:1.0

echo "Criando serviços do cluster..."
kubectl apply -f ./services.yml

echo "Criando deployments..."
kubectl apply -f ./deployment.yml
