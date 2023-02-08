#!/bin/bash

echo 'install k3s agent'

K3S_TOKEN=$(ssh root@10.1.107.226 'cat /var/lib/rancher/k3s/server/node-token')
K3S_URL="https://10.1.107.226:6443"

curl -sfL https://get.k3s.io | \
	INSTALL_K3S_VERSION="v1.24.9+k3s2" \
	K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN \
	INSTALL_K3S_EXEC="agent" \
	sh -s - \
	--node-name=node227 \
