kubectl delete secrets tekton-results-tls -n tekton-pipelines
kubectl create secret tls -n tekton-pipelines tekton-results-tls --cert=cert.pem --key=key.pem
