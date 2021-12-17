docker build . -t kafka-eagle:1.0
docker tag kafka-eagle:1.0 gcr.io/sap-sportsone/kafka-eagle:1.0-gcp
docker push gcr.io/sap-sportsone/kafka-eagle:1.0-gcp

kubectl apply -f kafka-eagle-gcp-deployment.yml
kubectl apply -f kafka-eagle-svc.yml


kubectl rollout restart deployment deployment-kafka-eagle