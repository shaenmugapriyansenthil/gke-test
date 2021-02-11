#!/bin/sh
set -e
git clone https://github.com/shaenmugapriyansenthil/gke-test.git
cd gke-test
docker build -t quay.io/shaenmugapriyan_senthil/gke-test .
cd ..
docker login -u="shaenmugapriyan_senthil" -p="s2AT9mMA61MBMJDINVRqPPWrganAuppIHMzTucbIijV1cj4VwRRVuidoqxAqAdzv" quay.io
docker push quay.io/shaenmugapriyan_senthil/gke-test
rm -rf gke-test
gcloud container clusters get-credentials my-k8s-cluster --zone us-central1-a --project gk-test-303111
kubectl rollout restart  deployment.apps/gks-deploy
