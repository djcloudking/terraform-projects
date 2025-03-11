# Create EKS Cluster using Terraform modules

### Prerequisites

Before you get started, make sure you have the following:

- AWS Account Access (with IAM permissions to create EKS, VPC, etc.)

- Knowledge of Kubernetes and AWS basics

- AWS CLI installed 

- Terraform installed.


### Clone the Repository

`git clone https://github.com/djcloudking/terraform-challenges.git

`cd terraform-challenges/11_Create a EKS Cluster using Terraform Modules


### Configure AWS


### Create Terraform Modules

Find the 6 modules here: [Terraform EKS Modules](https://github.com/djcloudking/terraform-challenges/tree/main/11_Create%20a%20EKS%20Cluster%20using%20Terraform%20Modules) 

- **VPC module**: Network layer with subnets, route tables, IGW

- **EKS module**: Control plane and worker nodes

- **Security Group module**: Ingress and egress rules

- **Variables file**: Inputs like VPC CIDR, EKS version

- **Versions file**: Terraform and provider versions

- **Outputs file**: Return useful values like cluster name, VPC ID


### Run Terraform

#### Initialize Terraform

`terraform init
 

#### Review Terraform Plan  

`terraform plan
 
 
#### Apply Terraform to Deploy EKS Cluster

`terraform apply

Type **yes** to confirm and start deploying your infrastructure.


### Securing the EKS Cluster

- Go to AWS EKS Console and open your cluster.

- Go to the "Access" tab. Then, copy the access entry (or create a new one if none exists).

- Select "Compute" tab: Ensure node group is active and meets desired state.

- Restrict access so only authorized users can interact with the cluster.


That’s all, folks! You created EKS cluster using Terraform modules.

Find the full tutorial here: [Create EKS cluster using Terraform modules ](https://cloudwithdj.com/creating-eks-cluster-using-terraform-modules/). 