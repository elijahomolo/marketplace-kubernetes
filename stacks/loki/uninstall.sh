#!/bin/sh

set -e

################################################################################
# Uninstall objects, namespace and delete CRDs
################################################################################
NAMESPACE="loki"
declare -a clusterrole=($(kubectl get clusterrole --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a clusterrolebinding=($(kubectl get clusterrolebinding --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a mutatingwebhookconfiguration=($(kubectl get mutatingwebhookconfiguration --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a validatingwebhookconfiguration=($(kubectl get validatingwebhookconfiguration --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a apiservice=($(kubectl get apiservice --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a podsecuritypolicy=($(kubectl get podsecuritypolicy --no-headers -o custom-columns=":metadata.name" | grep loki))
declare -a sts=($(kubectl get sts --no-headers -o custom-columns=":metadata.name" | grep loki))

for i in "${clusterrole[@]}"; do kubectl delete clusterrole "$i"; done && \
for i in "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding "$i"; done && \
for i in "${crd[@]}"; do kubectl delete crd "$i"; done && \
for i in "${mutatingwebhookconfiguration[@]}"; do kubectl delete mutatingwebhookconfiguration "$i"; done && \
for i in "${validatingwebhookconfiguration[@]}"; do kubectl delete validatingwebhookconfiguration "$i"; done && \
#for i in "${apiservice[@]}"; do kubectl delete apiservice "$i"; done && \
for i in "${podsecuritypolicy[@]}"; do kubectl delete podsecuritypolicy "$i"; done && \
for i in "${sts[@]}"; do kubectl delete sts "$i"; done && \
kubectl delete all --all && \
kubectl config set-context --current --namespace=default && \
kubectl delete ns $NAMESPACE
