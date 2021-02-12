#!/bin/sh

set -e

################################################################################
# Uninstall releasea and delete CRDs
################################################################################
STACK="kube-prometheus-stack"
NAMESPACE="kube-prometheus-stack"
declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep monitoring))

helm uninstall ${STACK} --namespace ${NAMESPACE} && \
for i in "${crd[@]}"; do kubectl delete crd "$i"; done && kubectl delete \
namespace $NAMESPACE
