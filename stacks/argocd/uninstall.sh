#!/bin/sh

set -e

################################################################################
# Uninstall objects, namespace and delete CRDs
################################################################################
STACK="kube-prometheus-stack"
NAMESPACE="kube-prometheus-stack"
declare -a CRD=("applications.argoproj.io" "appprojects.argoproj.io")
declare -a clusterrole=("argocd-application-controller" "argocd-server")
declare -a clusterrolebinding=("argocd-application-controller" "argocd-server")

kubectl delete svc,deploy,rs,cm,sa --all -n argocd && kubectl delete ns argocd \
&& for i in "${CRD[@]}"; do kubectl delete crd $i ; done && for i in \
 "${clusterrole[@]}"; do kubectl delete clusterrole $i ; done && \
 for i in "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding $i ;\
 done
