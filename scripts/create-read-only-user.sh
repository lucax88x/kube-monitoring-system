
# USER=read-only-user

# # kubectl create sa $USER
# # kubectl apply -f ./k8s/read-only-user.rbac.yaml

# SECRET=$(kubectl get sa $USER -o json | jq -r .secrets[].name)

# echo $SECRET

# CACRT=$(kubectl get secret $SECRET -o json | jq -r '.data["ca.crt"]' | base64 -d -i)

# echo $CACRT

# USER_TOKEN=$(kubectl get secret $SECRET -o json | jq -r '.data["token"]' | base64 -d -i)

# echo $USER_TOKEN
