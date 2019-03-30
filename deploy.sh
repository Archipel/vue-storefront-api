#!/usr/bin/env bash
TAG=eu.gcr.io/shared-199814/vue-storefront-api:git-$(git rev-parse HEAD)

cp docker/vue-storefront-api/Dockerfile .
docker build -t $TAG .
docker push $TAG
rm Dockerfile

sed "s#{{container-image}}#$TAG#" vue-storefront-api-deployment.tmpl.yaml > kubernetes/vue-storefront-api-deployment.yaml
kubectl apply -f kubernetes
