### External-DNS on AWS using EKS

This is an example of deploying external-dns to be used with kubernetes.
This will create a domain name/zone in route 53 you can then use that DNS with your k8s cluster.

## pre-req ##

You will need the following installed locally

Terrform https://www.terraform.io/downloads.html 

eksctl https://eksctl.io/introduction/installation/

AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

## Deploying Route 53 domain via terraform ##

mv to ```terrafrom-dns```

edit ```route-53.tf``` to your chosen domain name

deploy run ```terrafrom init``` & ```terraform apply```

## Creating cluster on AWS EKS using eksctl ##

Run script (10-15 mins to deploy)
mv to ```eksctl``` folder
```chmod +x eksctl-setup.sh```
```./eksctl-setup.sh```

This will install an eks cluster, will authenticate to AWS with normal ```.aws``` creds
Update eksctl args if needed in script.

Once cluster is fully provisioned, you should be able to run ```kubectl``` against the cluster.

If any issues check config in ```~/.kube```

To delete just run ```eksctl delete <cluster name>``` (20mins to delete, check cloudfromation stack is fully deleted)

## Deploy external-dns on cluster ##

All yaml resources will be deployed automatically, providing files are in the live-demo folder that flux is polling.

If not just manually deploy on cluster using ```kubectl apply -f .```

## To get hosted zone ID & view records-sets ##

```aws route53 list-hosted-zones```

```aws route53 list-resource-record-sets --output json --hosted-zone-id "<input hosted zone>"```
