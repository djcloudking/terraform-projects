# Building a Multi-AZ VPC Architecture with Terraform

## Scenario

You have been tasked with deploying some basic infrastructure on AWS to host a proof of concept environment. The architecture needs to include both public and private subnets and span multiple Availability Zones to test failover and disaster recovery scenarios. You expect to host Internet-facing applications. Additionally, you have other applications that need to access the Internet to retrieve security and operating system updates.

## Solution

To delivery this proof of concept, this is what I will do:

- Create a new VPC in your account in the US-East-1 region

- Create public and private subnets in three different Availability Zones

- Deploy an Internet Gateway and attach it to the VPC
 
- Provision a NAT Gateway (a single instance will do) for outbound connectivity

- Ensure that route tables are configured to properly route traffic based on the requirements

Now, I know what to do, let me use Terraform to accomplish the goal.


### Prepare files and credentials for using Terraform to deploy cloud resources

- Create 2 files: **main.tf** and **variables.tf**

- In **main.tf**, copy the code you see in my main.tf 

- In **variables.tf**, copy the code you see in my variables.tf 


### Set credentials for Terraform deployment


### Deploy the AWS infrastructure using Terraform

