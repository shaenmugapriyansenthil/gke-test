#!/bin/sh
set -e
git clone https://github.com/shaenmugapriyansenthil/gke-test.git
cd gke-test
docker build -t quay.io/shaenmugapriyan_senthil/gke-test .
cd ..
docker login -u="shaenmugapriyan_senthil" -p="3P5FhiiDj9yTVSKu3UYF/3c8Xko65IK2wDXDa1S+kEEz4oKfKmBDX8bK2A+srGvr" quay.io
docker push quay.io/shaenmugapriyan_senthil/gke-test
rm -rf gke-test
gcloud container clusters get-credentials my-k8s-cluster --zone us-central1-a --project gk-test-303111
kubectl rollout restart  deployment.apps/gks-deploy
