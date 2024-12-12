# Building a Terraform workflow using GitHub Actions

To build a Terraform workflow using GitHub Actions for Continuous Integration/Continuous Deployment (CI/CD), you'll set up automation to manage your Terraform infrastructure using GitHub's CI/CD capabilities. 

Here's a detailed, step-by-step guide to create this workflow.


### Prerequisites

- GitHub Account (and a repository where the Terraform code is stored)

- Terraform installed 

- AWS account with administrator rights.


### Step 1: Create a New GitHub Repository (if needed)

If you don’t have an existing repository, create one on GitHub to store your Terraform files.


### Step 2: Configure Terraform Code

Ensure that your Terraform configuration files are structured properly within your repository. 


### Step 3: Store Cloud Provider Credentials in GitHub Secrets

GitHub Actions will need access to your cloud provider’s credentials to apply the Terraform configuration. Store the cloud provider credentials in GitHub Secrets.

1. Go to your GitHub repository.

2. Navigate to **Settings** > **Secrets and variables** > **Actions**.

3. Click **New repository secret**.

4. Add the following secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`
   

### Step 4: Set Up GitHub Actions Workflow File

Create a GitHub Actions workflow to automate your CI/CD pipeline.

1. In your repository, navigate to the **Actions** tab.

2. Click on **New workflow**.

3. Choose **set up a workflow yourself** to create a custom workflow file.

4. Create the `.github/workflows/terraform.yml` file in the repository.



```yaml
name: Terraform CI/CD

on:
  push:
    branches:
      - main  # Trigger on push to main branch
  pull_request:
    branches:
      - main  # Trigger on pull request to main branch

jobs:
  terraform:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v2
      with:
        terraform_version: '1.3.0'  # specify the version of Terraform

    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v2
      with:
        aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws_region: ${{ secrets.AWS_REGION }}

    - name: Terraform Init
      run: terraform init

    - name: Terraform Plan
      run: terraform plan -out=tfplan

    - name: Terraform Apply
      run: terraform apply -auto-approve tfplan
      # Uncomment the next line for automatic approval on production
      # if the plan is valid
```

##### Breakdown of the Workflow

- **`on:` section**: This defines when the pipeline will trigger. In this case, the pipeline triggers on `push` to the `main` branch and on a pull request targeting the `main` branch.

- **`jobs:` section**: The jobs section defines what actions are performed.

- **Checkout code**: This step checks out the repository’s code into the GitHub runner.

- **Set up Terraform**: Installs Terraform and specifies the version to use.

- **Configure AWS credentials**: This step uses the GitHub Secrets to configure AWS credentials (or equivalent for Azure/GCP).

- **Terraform Init**: Initializes the Terraform project by downloading necessary providers and setting up the backend.

- **Terraform Plan**: Runs `terraform plan` to check the changes that will be made in your infrastructure.

- **Terraform Apply**: Applies the Terraform plan to the cloud provider, creating or modifying infrastructure resources.

### Step 5: Test the Workflow

1. Commit and push the changes to the repository.

2. Navigate to the **Actions** tab in your GitHub repository.

3. You should see the Terraform workflow triggered by your commit. Monitor the progress of each step.

4. Once the workflow completes successfully, Terraform will apply the changes to the cloud infrastructure.


By following these steps, you've set up a GitHub Actions pipeline that automatically runs Terraform workflows (init, plan, and apply) whenever changes are made to the code. This automation greatly reduces the risk of manual errors and enables fast, repeatable infrastructure deployments, enhancing the CI/CD process for managing cloud infrastructure.