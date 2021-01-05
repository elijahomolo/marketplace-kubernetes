#!/bin/sh

set -e

STACK="okteto"
CHART_VERSION="0.5.1"
RELEASE="do"
NAMESPACE="okteto"

crd=("certificaterequests.cert-manager.io"
"certificates.cert-manager.io"
"challenges.acme.cert-manager.io"
"clusterissuers.cert-manager.io"
"issuers.cert-manager.io"
"orders.acme.cert-manager.io"
"helmreleases.helm.fluxcd.io"
"kongplugins.configuration.konghq.com"
"kongclusterplugins.configuration.konghq.com"
"kongconsumers.configuration.konghq.com"
"kongcredentials.configuration.konghq.com"
"kongingresses.configuration.konghq.com"
"tcpingresses.configuration.konghq.com"
"functions.openfaas.com" )


declare -a clusterrole=($(kubectl get clusterrole --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))
declare -a clusterrolebinding=($(kubectl get clusterrolebinding --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))
#declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))
declare -a mutatingwebhookconfiguration=($(kubectl get mutatingwebhookconfiguration --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))
declare -a validatingwebhookconfiguration=($(kubectl get validatingwebhookconfiguration --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))
declare -a apiservice=($(kubectl get apiservice --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))
declare -a podsecuritypolicy=($(kubectl get podsecuritypolicy --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx'))

helm uninstall ${RELEASE} --namespace ${NAMESPACE} && \
for i in "${clusterrole[@]}"; do kubectl delete clusterrole "$i"; done && \
for i in "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding "$i"; done && \
for i in "${crd[@]}"; do kubectl delete crd "$i"; done && \
for i in "${mutatingwebhookconfiguration[@]}"; do kubectl delete mutatingwebhookconfiguration "$i"; done && \
for i in "${validatingwebhookconfiguration[@]}"; do kubectl delete validatingwebhookconfiguration "$i"; done && \
#for i in "${apiservice[@]}"; do kubectl delete apiservice "$i"; done && \
for i in "${podsecuritypolicy[@]}"; do kubectl delete podsecuritypolicy "$i"; done && \
kubectl delete ns ${NAMESPACE}
