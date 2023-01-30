#helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
#helm repo update


kubectl create ns ingress

helm install -n ingress ingress-nginx ingress-nginx/ingress-nginx 
