### Create Terraform Infrastructure with Docker

1- In the "Code Editor" tab, create a **terraform.tf** file.

***This file includes the terraform block, which defines the provider and Terraform versions you will use with this project.***


2- Next, create **main.tf** and copy and paste the following configuration.




3- Open the terminal, initialize the project, which downloads a plugin that allows Terraform to interact with Docker: **terraform init**




4- Provision the NGINX server container with **terraform apply**. When Terraform asks you to confirm, type **yes** and press **ENTER**.



5- Verify NGINX instance. Run **docker ps** to view the NGINX container running in Docker via Terraform.


You have now provisioned and destroyed an NGINX webserver with Terraform.
