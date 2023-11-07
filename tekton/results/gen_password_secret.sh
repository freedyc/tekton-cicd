kubectl create secret generic tekton-results-postgres --namespace="tekton-pipelines" --from-literal=POSTGRES_USER=postgres --from-literal=POSTGRES_PASSWORD=ddi@zdns2022
