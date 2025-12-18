# Terraform Projects – Infrastructure as Code

This repository contains **Terraform examples focused on operational infrastructure**, not just deployments.

The goal is to demonstrate:
- Safe, repeatable infrastructure provisioning
- Environments that can be supported and troubleshot in production
- Clean IaC structure and naming conventions

## What This Project Demonstrates
- Terraform basics applied to real AWS resources
- Modular infrastructure design
- State management awareness
- Infrastructure that supports monitoring and operations

## Infrastructure Examples
- EC2 instances with security groups
- VPC and subnet configuration
- IAM roles and policies
- Basic monitoring-friendly setups

## Tools & Technologies
- Terraform
- AWS (EC2, VPC, IAM)
- AWS CLI

## Ops Perspective
This repo is written from an **operations mindset**:
- Infrastructure should be observable
- Changes should be predictable
- Rollbacks should be possible
- Configurations should be readable by support teams

## How to Use
1. Clone the repository
2. Review variables and providers
3. Run `terraform init`
4. Use `terraform plan` before applying
5. Apply in a non-production AWS account

## Why This Matters
Many Cloud Ops and Infrastructure Support roles expect engineers to:
- Read Terraform
- Understand what it creates
- Troubleshoot issues caused by IaC changes

This repo shows that capability.
