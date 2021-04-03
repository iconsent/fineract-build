#!/bin/bash

echo
echo "Starting fineract server..."
kubectl apply -f fineract-server-deployment.yml

fineract_server_pod=""
while [[ ${#fineract_server_pod} -eq 0 ]]; do
    fineract_server_pod=$(kubectl get pods -l tier=backend --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
done

fineract_server_status=$(kubectl get pods ${fineract_server_pod} --no-headers -o custom-columns=":status.phase")
while [[ ${fineract_server_status} -ne 'Running' ]]; do
    sleep 1
    fineract_server_status=$(kubectl get pods ${fineract_server_pod} --no-headers -o custom-columns=":status.phase")
done

echo "Fineract server is up and running"
