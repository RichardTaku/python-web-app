#!/bin/bash

echo "Starting check for unused namespaces..."

# Exclude system namespaces: default, kube-system, kube-public
EXCLUDED_NAMESPACES="^(default|kube-system|kube-public)"
EMPTY_NAMESPACES=""

for NS in $(kubectl get ns --no-headers -o custom-columns=":metadata.name" | grep -v -E $EXCLUDED_NAMESPACES); do
  if [ -z "$(kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get -n $NS --ignore-not-found --no-headers -o name)" ]; then
    echo "Identified empty namespace: $NS"
    EMPTY_NAMESPACES="$EMPTY_NAMESPACES $NS"
  fi
done

if [ -z "$EMPTY_NAMESPACES" ]; then
  echo "No empty namespaces found."
else
  echo "---------------------------------"
  echo "The following namespaces will be deleted:"
  echo $EMPTY_NAMESPACES
  echo "---------------------------------"
  read -p "Are you sure you want to delete these namespaces? (y/N) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "Proceeding with deletion..."
    # The actual deletion command
    kubectl delete namespace $EMPTY_NAMESPACES
  else
    echo "Deletion cancelled."
  fi
fi

