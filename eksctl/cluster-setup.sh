#!/bin/bash

#Check eksctl installed
eksctl version

#Create a EKS cluster change parametes to your needs
eksctl create cluster \
--name eks-cluster \
--version 1.14 \
--nodegroup-name standard-workers \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto \
--external-dns-access #This will create IAM policy so worker nodes can contact route 53 

#Check connectivty to cluster
eksctl get cluster
kubectl get nodes 