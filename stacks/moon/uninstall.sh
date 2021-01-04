#!/bin/sh


kubectl delete all --all -n moon && kubectl config set-context\
 --current --namespace=default && kubectl delete namespace moon
