locals {

  tf-eks-node-userdata = <<TFEKSNODEUSERDATA


#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.iac_eks_cluster.endpoint}'
TFEKSNODEUSERDATA

}

