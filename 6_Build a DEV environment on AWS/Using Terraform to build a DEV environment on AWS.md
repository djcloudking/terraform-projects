# Build a DEV environment on AWS Using Terraform 

### Prerequisites

- An AWS account

- An IAM user with the necessary permissions for Terraform

- Terraform installed on your local machine

- Your AWS credentials (secret access key)


### Steps to build your dev environment

1. **IAM Setup**

- Configure IAM to manage permissions and access for Terraform.

- Download your access keys.

2. **VSCode Setup for AWS and Terraform**

- Install and configure the necessary extensions for VSCode to work with AWS and Terraform.

- Extensions: AWS CLI Configure, AWS boto3, Harshicorp Terraform, Remote SSH, 

3. **Terraform Init and the AWS Provider**

- Initialize Terraform and configure the AWS provider.

4. **Terraform Apply an AWS VPC**

- Use Terraform to create a VPC in AWS.

5. **Terraform Resource Referencing and AWS Subnets**

- Reference Terraform resources to create and manage AWS subnets.

6. **Terraform fmt and AWS Internet Gateway**

- Format Terraform code and create an AWS internet gateway.

7. **AWS Route Tables with Terraform**

- Define and manage AWS route tables using Terraform.

8. **Terraform and AWS Route Table Associations**

- Associate route tables with subnets using Terraform.

9. **AWS Security Groups with Terraform**

- Create and manage AWS security groups using Terraform.

10. **Terraform Data Sources**

- Use Terraform data sources to query information about your AWS resources.

11. **An EC2 Key Pair with Terraform**

- Create an EC2 key pair for secure access to your instances.

12. **AWS EC2 Instance with Terraform**

- Use Terraform to launch an EC2 instance in AWS.

13. **AWS EC2 Userdata with Terraform**

- Define userdata scripts to configure your EC2 instance during startup.

14. **VSCode SSH Configuration**

- Set up SSH configuration in VSCode for easy access to your EC2 instances.

15. **Terraform Provisioners**

- Use Terraform provisioners to run scripts and perform configuration tasks on your resources.

16. **Terraform Replace and the EC2 Deployment**

- Replace existing resources and deploy new EC2 instances with Terraform.

17. **Terraform Variables**

- Use variables to parameterize your Terraform configuration for flexibility and reusability.

18. **Terraform Output Basics**

- Use Terraform's output feature to display useful information about your deployed resources.


### Terraform Commands I used

- `terraform init`

- `terraform plan`

- `terraform apply`

- `terraform apply -auto-approve`

- `terraform show list`

- `terraform destroy`


**Read more**

Find more details, the steps by steps guide in this article about how I was able to set up a secure AWS environment with Docker using Terraform, manage AWS resources efficiently, and connect to AWS instances using VSCode's Remote SSH extension. Click the link =>> https://medium.com/@djakkone/building-a-dev-environment-on-aws-using-terraform-9e4c4a8522c6
