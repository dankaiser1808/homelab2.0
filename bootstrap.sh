#!/bin/bash

if [ -z "$AWS_ACCESS_KEY" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$CLUSTER_NAME" ] || [ -z "$KUBECONFIG" ]; then
  echo "Error: AWS_ACCESS_KEY, AWS_SECRET_ACCESS_KEY, KUBECONFIG and CLUSTER_NAME must be set"
  exit 1
fi

kubectl create namespace external-secrets

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
    name: awssm-secret
    namespace: external-secrets
type: Opaque
stringData:
    access-key: ${AWS_ACCESS_KEY}
    secret-access-key: ${AWS_SECRET_ACCESS_KEY}
EOF

helm repo add cilium https://helm.cilium.io
helm repo update
helm install cilium cilium/cilium --version 1.18.2 -n kube-system -f https://raw.githubusercontent.com/dankaiser1808/homelab2.0/refs/heads/main/core/controllers/base/cilium/values.yaml

flux bootstrap github \
  --owner=dankaiser1808 \
  --repository=homelab2.0 \
  --branch=main \
  --path=./clusters/"$CLUSTER_NAME" \
  --personal
