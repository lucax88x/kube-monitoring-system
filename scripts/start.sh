docker run \
  -d \
  -p 3100:3000 \
  --name=grafana \
  -e "GF_SECURITY_ADMIN_PASSWORD=Password01!" \
  -e "GF_INSTALL_PLUGINS=raintank-worldping-app,grafana-kubernetes-app" \
  grafana/grafana:latest