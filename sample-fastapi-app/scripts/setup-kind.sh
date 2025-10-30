#!/usr/bin/env bash
set -e
# install kind & kubectl if not present
if ! command -v kind >/dev/null 2>&1; then
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
fi
if ! command -v kubectl >/dev/null 2>&1; then
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
fi
kind create cluster --name dev-kind
kubectl cluster-info --context kind-dev-kind
