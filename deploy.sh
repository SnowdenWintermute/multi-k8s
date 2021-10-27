docker build -t snowd3n/multi-client -f ./client/Dockerfile ./client
docker build -t snowd3n/multi-server -f ./server/Dockerfile ./server
docker build -t snowd3n/multi-worker -f ./worker/Dockerfile ./worker
docker push snowd3n/multi-client
docker push snowd3n/multi-server
docker push snowd3n/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/worker-deployment
echo nothing