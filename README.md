# Deploy AKS with 3 tier Networking and Container Registry

This repository contains all you need to use Terraform to deploy Azure Kubernetes Service with Vnet and Container Registry

It automatically creates:

* A resource group
* A virtual network 
* Three subnets within the virtual network
* NAT Gateway
* Network Interfaces
* Security Groups
* Firewall
* Azure Container Registry
* An Azure Kubernetes Service cluster

## How it works

The terraform code for deploying the above infrastructure is divided in three modules - Networking , Kubernetes and ContainerRegistry. All the modules are in the `modules` directory with there individual documentations. 

## How to deploy

You need to have Terraform v1.2.2 installed and Azure CLI 2.0 installed, obviously. Follow [this article](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli) to login with az cli if not sure

Clone this repository

```bash
cd azure-boilerplate
```

*Optional: update the `variables.tf` files with desired values.*


Initialize Terraform

```bash
terraform init
```

Plan the deployment:

```bash
terraform plan -out out.plan
```

Apply the plan to start the deployment:

```bash
terraform apply "out.plan"
```

Wait for the deployment to be completed.

## How to destroy

Go to the `azure-boilerplate` directory:

```bash
cd azure-boilerplate
```

Call Terraform destroy:

```bash
terraform destroy
```