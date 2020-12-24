#!/bin/sh

set -e

# Delete all objects with label cloud-native-installer and delete
# ClusterRoleBindings
## Adding a command to delete svc since it doesn't have a label
kubectl delete all -l app=cloud-native-installer && kubectl delete svc \
cloud-native-installer && kubectl delete clusterrolebindings gluu-cluster-admin
