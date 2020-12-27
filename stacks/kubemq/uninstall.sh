#!/bin/sh

set -e

################################################################################
# Uninstall objects, namespace and delete CRDs
################################################################################
NAMESPACE="kubemq"
declare -a CRD=("kubemqclusters.core.k8s.kubemq.io" \
"kubemqconnectors.core.k8s.kubemq.io" "kubemqdashboards.core.k8s.kubemq.io")
declare -a clusterrole=("kubemq-operator")
declare -a role=("kubemq-cluster")
declare -a clusterrolebinding=("kubemq-operator-kubemq-crb")

kubectl delete all --all -n ${NAMESPACE} && kubectl delete ns $NAMESPACE \
 && for i in "${CRD[@]}"; do kubectl delete crd $i ; done && for i in \
 "${clusterrole[@]}"; do kubectl delete clusterrole $i ; done &&  for i in \
 "${role[@]}"; do kubectl delete role $i; done && for i in \
 "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding $i ;\
 done
