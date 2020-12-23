STACK="cloud-manager"
CHART="ei/einnovator-devops"
CHART_VERSION="1.0.0"
NAMESPACE="einnovator"

helm uninstall $STACK -n $NAMESPACE && kubectl delete namespace $NAMESPACE
