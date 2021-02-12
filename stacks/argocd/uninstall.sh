#!/bin/sh

set -e

################################################################################
# Uninstall objects, namespace and delete CRDs
################################################################################
NAMESPACE="argocd"
declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep argocd))
declare -a clusterrole=($(kubectl get clusterrole --no-headers -o custom-columns=":metadata.name" | grep argocd ))
declare -a clusterrolebinding=($(kubectl get clusterrolebinding --no-headers -o custom-columns=":metadata.name" | grep argocd))

kubectl delete svc,deploy,rs,cm,sa --all -n ${NAMESPACE} && kubectl delete \
ns argocd && for i in "${crd[@]}"; do kubectl delete crd "$i"; done &&  for i \
in "${clusterrole[@]}"; do kubectl delete clusterrole "$i"; done && \
for i in "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding \
"$i"; done
