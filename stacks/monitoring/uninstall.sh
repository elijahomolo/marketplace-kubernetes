#!/bin/sh

set -e


################################################################################
# Uninstall releasea and delete CRDs
################################################################################
STACK_1="kube-prometheus-stack"
STACK_2="metrics-server"
NAMESPACE_1="kube-prometheus-stack"
NAMESPACE_2="kube-system"
declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep 'monitoring'))


helm uninstall ${STACK_1} --namespace ${NAMESPACE_1} && \
helm uninstall ${STACK_2} --namespace ${NAMESPACE_2} && \
for i in "${crd[@]}"; do kubectl delete crd $i ; done && kubectl delete \
namespace ${NAMESPACE_1}
