#!/bin/sh

set -e


STACK="ambassador"
CHART="datawire/ambassador"
CHART_VERSION="6.5.13"
NAMESPACE="ambassador"

declare -a crd=($(kubectl get crd --no-headers -o custom-columns=":metadata.name" | grep getambassador))


helm uninstall $STACK --namespace $STACK && for i in "${crd[@]}";\
 do kubectl delete crd "$i"; done && kubectl delete namespace $NAMESPACE
