#!/bin/bash

echo 'install k3s server'

curl -sfL https://get.k3s.io | \
	INSTALL_K3S_VERSION="v1.24.9+k3s2" \
	INSTALL_K3S_EXEC="server" sh -s - \
	--node-name=node226 \
	--cluster-init \
