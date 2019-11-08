CONTEXT=$(kubectl config view -o jsonpath='{.current-context}')

echo USING CURRENT CONTEXT: $CONTEXT

read -p "Continue? (y/n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
  kubectl apply -f k8s/monitoring/monitoring.namespace.yaml
  kubectl apply -f k8s/monitoring/prometheus.cluster-role.yaml
  kubectl apply -f k8s/monitoring/prometheus.deployment.yaml
  kubectl apply -f k8s/monitoring/prometheus.config-map.yaml

  kubectl apply -f k8s/kube-system/kube-state-metrics.deployment.yaml
  kubectl apply -f k8s/kube-system/node-exporter.daemon-set.yaml
else
  echo 'Exiting..'
  exit 1
fi

