# Protect Terraform sensitive input variables


Deploy a secure web application on AWS using Terraform, while ensuring that sensitive data such as database credentials, API tokens, and access keys were not exposed in logs, CLI outputs, or version control.

Key security measures included marking variables as sensitive, using environment variables for secret injection, and securing Terraform state files.


### What I did:###

**Terraform Infrastructure**: Deployed a VPC, ALB, EC2 instances, and an RDS database using Infrastructure as Code (IaC).
    
**Sensitive Variable Management**: Used Terraform’s sensitive attribute to prevent secret exposure.
    
**Environment-Based Secrets**: Implemented .tfvars files and environment variables for secure credential handling.
    
**Remote State Storage**: Configured AWS S3 with encryption to protect Terraform state.
    
**Access Control & IAM**: Restricted access to state files and sensitive outputs using IAM policies.


### Key Technologies & Tools Used:###

- **Terraform:** Infrastructure as Code for AWS resource provisioning.
    
- **AWS IAM & Security Groups:** Role-based access and network security enforcement.
    
- **AWS S3 (Remote State Storage):** Secure Terraform state with encryption and restricted access.
    
- **AWS Secrets Manager & HashiCorp Vault:** Best practices for managing secrets.
    
- **Git & .gitignore:** Prevented sensitive data from being committed to version control.


### What you’ll learn:###

- How to protect sensitive data in Terraform using built-in security features.
    
- The importance of securing Terraform state files with remote storage and access restrictions.
    
- How to inject sensitive values into Terraform configurations without exposing them in logs.
    
- Best practices for infrastructure automation and security in AWS environments.


Read more =>> [How To Proctect Sensitive Input Variables With Terraform](https://cloudwithdj.com/how-to-protect-sensitive-input-variables-with-terraform/)