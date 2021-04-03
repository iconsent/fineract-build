#!/bin/bash

echo "Setting Up Fineract service configuration..."

echo -n "Fineract mysql hostname: " 
read _HOST

echo -n "Fineract mysql username: "
read _USERNAME

echo -n "Fineract mysql password: "
read _PASSWORD

kubectl create configmap fineractmysql --from-literal=hostname=$_HOST
kubectl create secret generic fineract-tenants-db-secret --from-literal=username=$_USERNAME --from-literal=password=$_PASSWORD

