docker build -t saho87/multi-client:latest -t saho87/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t saho87/multi-server:latest -t saho87/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t saho87/multi-worker:latest -t saho87/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push saho87/multi-client:latest
docker push saho87/multi-server:latest
docker push saho87/multi-worker:latest

docker push saho87/multi-client:$SHA
docker push saho87/multi-server:$SHA
docker push saho87/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=saho87/multi-client:$SHA
kubectl set image deployments/server-deployment server=saho87/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=saho87/multi-worker:$SHA