CONTEXT=$(kubectl config view -o jsonpath='{.current-context}')

echo USING CURRENT CONTEXT: $CONTEXT

CLUSTER=$(kubectl config view -o jsonpath='{.contexts[?(@.name == "'$CONTEXT'")].context.cluster}')
USER=$(kubectl config view -o jsonpath='{.contexts[?(@.name == "'$CONTEXT'")].context.user}')

CA_CRT=$(kubectl config view --raw -o jsonpath='{.clusters[?(@.name == "'$CLUSTER'")].cluster.certificate-authority-data}')
SERVER_URL=$(kubectl config view --raw -o jsonpath='{.clusters[?(@.name == "'$CLUSTER'")].cluster.server}')
CLIENT_CRT=$(kubectl config view --raw -o jsonpath='{.users[?(@.name == "'$USER'")].user.client-certificate-data}')
CLIENT_KEY=$(kubectl config view --raw -o jsonpath='{.users[?(@.name == "'$USER'")].user.client-key-data}')

echo ______________________________________________________________________________________________________________________________
echo SERVER_URL IS 
echo $SERVER_URL
echo ______________________________________________________________________________________________________________________________
echo CA_CRT IS
echo $CA_CRT | base64 -d
echo ______________________________________________________________________________________________________________________________
echo CLIENT_CRT IS 
echo $CLIENT_CRT | base64 -d
echo ______________________________________________________________________________________________________________________________
echo CLIENT_KEY IS 
echo $CLIENT_KEY | base64 -d
echo ______________________________________________________________________________________________________________________________