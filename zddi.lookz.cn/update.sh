#!/bin/bash
# 第一步： 先执行以下命令生成证书
# certbot certonly  -d *.zddi.lookz.cn --manual --preferred-challenges dns

# 第二步： 替换证书
# tekton
kubectl delete secrets zddi.lookz.cn -n cicd
kubectl create secret tls zddi.lookz.cn --cert=./fullchain.pem --key=./privkey.pem  -n cicd

# cicd
kubectl delete secrets zddi.lookz.cn -n tekton-pipelines
kubectl create secret tls zddi.lookz.cn --cert=./fullchain.pem --key=./privkey.pem  -n tekton-pipelines

# rancher
kubectl delete secrets zddi.lookz.cn -n cattle-system
kubectl create secret tls zddi.lookz.cn --cert=./fullchain.pem --key=./privkey.pem  -n cattle-system

# default 
kubectl delete secrets zddi.lookz.cn -n default
kubectl create secret tls zddi.lookz.cn --cert=./fullchain.pem --key=./privkey.pem  -n default

# result

kubectl delete secrets tekton-results-tls -n tekton-pipelines 
kubectl create secret tls -n tekton-pipelines tekton-results-tls --cert=./fullchain.pem --key=./privkey.pem
