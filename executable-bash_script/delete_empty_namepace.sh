#!/bin/bash

echo "delete unused namespaces..."

for NS in $(kubectl get ns --no-headers -o custom-columns=":metadata.name" | grep -v -E '^(default|kube-system|kube-public)'); do
  if [ -z "$(kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get -n $NS --ignore-not-found --no-headers -o name)" ]; then
    echo "Deleting namespace: $NS"
    kubectl delete namespace $NS
  fi
done

