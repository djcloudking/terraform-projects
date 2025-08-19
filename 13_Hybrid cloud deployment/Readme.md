# Multi-Country Payroll Software Deployment


## Overview

This project demonstrates how to deploy a payroll software application in multiple countries using **Terraform**. Each country gets its own instance deployed on **AWS**, following the same architecture and infrastructure blueprint. This allows for consistent, repeatable deployments across different regions.


## Scenario

Fahmacloud has designed a blueprint for a prototype payroll software. The software needs to be deployed in several countries, with each instance maintaining the same technology stack and infrastructure configuration. Terraform is used to automate and replicate deployments efficiently, reducing manual setup and ensuring consistency.

**** Note: I was asked to provide a POC (Proof of Concept). This repo contains a simplified version of the POC I built so it’s easier to understand the deployment process. The payroll app’s source code is not included, and I’ve intentionally left out the security configuration details.***


## Key Features

* **Multi-region deployment:** Supports deploying payroll software in multiple countries with isolated instances.
* **Infrastructure as Code:** Uses Terraform modules for reusable and scalable infrastructure.
* **Consistency:** Each instance uses the same blueprint to ensure a consistent architecture.
* **AWS-based:** Leverages AWS cloud resources for reliable and scalable deployments.


## Notes / Prerequisites

* Ensure your AWS credentials are configured before running Terraform.
* Each country-specific directory contains a `providers.tf` to configure AWS provider settings.
* The `modules/payroll-app` directory contains reusable Terraform modules for the payroll software infrastructure.


## Steps to deploy the payroll app across 2 countries

0. **Recreate all the configuration files located in 'Hybrid cloud deployment' folder**:
   
1. **Go to 'Hybrid cloud deployment' folder**:

```bash
cd 'Hybrid cloud deployment'
```

2. **Initialize Terraform**:

```bash
terraform init
```

3. **Plan deployment for a country**:

```bash
cd uspayroll-app   # or ukpayroll-app
terraform plan
```

4. **Apply deployment**:

```bash
terraform apply
```

This will provision all required AWS resources for the payroll software in the selected country.

5. **Repeat step 3 and 4 for the second country**:


---

Voila! You have deployed a payroll software across the US and UK. 

Note: If real-life, you should test the payroll app after deployment, and add several monitoring tools in place.  


