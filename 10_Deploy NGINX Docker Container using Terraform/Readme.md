### Create Terraform Infrastructure with Docker

1- In the "Code Editor" tab, create a terraform.tf file.

***This file includes the terraform block, which defines the provider and Terraform versions you will use with this project.***


2- Next, open main.tf and copy and paste the following configuration.
copy
provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
In the "Terminal" tab, initialize the project, which downloads a plugin that allows Terraform to interact with Docker.
copy
terraform init
Provision the NGINX server container with apply. When Terraform asks you to confirm, type yes and press ENTER.
copy
terraform apply
Verify NGINX instance
Run docker ps to view the NGINX container running in Docker via Terraform.
copy
docker ps
Destroy resources
To stop the container and destroy the resources created in this tutorial, run terraform destroy. When Terraform asks you to confirm, type yes and press ENTER.
copy
terraform destroy
You have now provisioned and destroyed an NGINX webserver with Terraform.
