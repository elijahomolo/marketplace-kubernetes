#!/bin/sh

set -e


kubectl delete all --all -n fyipe && kubectl delete namespace fyipe && \
kubectl config set-context --current --namespace=default
