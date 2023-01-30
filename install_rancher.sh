# helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

#kubectl create namespace cattle-system

kubectl -n cattle-system create \
	secret tls tls-rancher-ingress \
	--cert=/root/zddi.lookz.cn/fullchain.pem \
	--key=/root/zddi.lookz.cn/privkey.pem

helm install rancher rancher-stable/rancher \
	--namespace cattle-system \
	--set hostname=rancher226.zddi.lookz.cn \
	--set ingress.tls.source=secret \
