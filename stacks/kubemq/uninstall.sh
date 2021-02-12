#!/bin/sh

set -e

################################################################################
# Uninstall objects, namespace and delete CRDs
################################################################################
NAMESPACE="kubemq"
declare -a clusterrole=($(kubectl get clusterrole --no-headers -o custom-columns=":metadata.name" | grep kubemq))
declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep kubemq))
declare -a role=($(kubectl get role --no-headers -o custom-columns=":metadata.name" | grep kubemq))
declare -a clusterrolebinding=($(kubectl get clusterrolebinding --no-headers -o custom-columns=":metadata.name" | grep kubemq))

kubectl delete all --all -n ${NAMESPACE} && kubectl delete ns $NAMESPACE \
 && for i in "${crd[@]}"; do kubectl delete crd "$i"; ; done && for i in \
 "${clusterrole[@]}"; do kubectl delete clusterrole "$i" ; done &&  for i in \
 "${role[@]}"; do kubectl delete role "$i"; done && for i in \
 "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding "$i"; \
 done
