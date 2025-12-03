#!/bin/bash

# Iterate over all namespace names
for ns in $(kubectl get ns -o jsonpath='{.items[*].metadata.name}'); do
    # Check if 'kubectl get all' returns zero lines in that namespace
    # '2>/dev/null' suppresses error messages if 'get all' fails for some reason
    if [[ $(kubectl get all -n "$ns" --no-headers 2>/dev/null | wc -l) -eq 0 ]]; then
        echo "Namespace $ns appears to be empty."
    fi
done

`
