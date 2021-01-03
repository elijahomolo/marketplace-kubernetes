#!/bin/sh

set -e

declare -a clusterrole=($(kubectl get clusterrole --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))
declare -a clusterrolebinding=($(kubectl get clusterrolebinding --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))
declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))
declare -a mutatingwebhookconfiguration=($(kubectl get mutatingwebhookconfiguration --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))
declare -a validatingwebhookconfiguration=($(kubectl get validatingwebhookconfiguration --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))
declare -a apiservice=($(kubectl get apiservice --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))
declare -a podsecuritypolicy=($(kubectl get podsecuritypolicy --no-headers -o custom-columns=":metadata.name" | grep 'ingress-nginx\|mysql-operator\|minio-operator\|mattermost-operator'))

for i in "${clusterrole[@]}"; do kubectl delete clusterrole "$i"; done && \
for i in "${clusterrolebinding[@]}"; do kubectl delete clusterrolebinding "$i"; done && \
for i in "${crd[@]}"; do kubectl delete crd "$i"; done && \
for i in "${mutatingwebhookconfiguration[@]}"; do kubectl delete mutatingwebhookconfiguration "$i"; done && \
for i in "${validatingwebhookconfiguration[@]}"; do kubectl delete validatingwebhookconfiguration "$i"; done && \
#for i in "${apiservice[@]}"; do kubectl delete apiservice "$i"; done && \
for i in "${podsecuritypolicy[@]}"; do kubectl delete podsecuritypolicy "$i"; done && \
for i in ingress-nginx mysql-operator minio-operator mattermost-operator; do \
kubectl delete all --all -n $i && kubectl delete ns $i; done
