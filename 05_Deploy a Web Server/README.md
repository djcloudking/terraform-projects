# Using Terraform To Deploy a web server

In this tutorial I will talk about the following scenario:

You are the DevOps engineer on watch. You supervisor asked to implement some resources in the company AWS environment. He asked you: 

1) Create a DB server and output a private IP.
   
2) Create a web server and ensure it has a fix IP.

3) Create a security group for the web server opening ports 80 and 443 (Http & https).

4) Run the provided script on the server. 


Let's begin:

## Step 1: Create a DB server and output a private IP

- Open VS code

- Create a folder named **Web Server**. 

- Under that folder, create another folder called **dbserverchallenege**.

- Inside the **dbserverchallenege**, create a file named **server-script.sh**

- Copy the script below in **server-script.sh**. 


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/80bfcb77-a4d6-498a-bf8a-d0561cb3f17a)


- Create a **main.tf** file, and add the script below to the file.

- Create the ec2 resource.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/cd0fa240-3d7e-4aaf-beed-4ece6c066c0a)


## Step 2: Create a web server and ensure it has a fix IP

- Copy the same script but replace tag name with **"Web server"**.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/a6811b7c-e94e-41c1-9f1f-25098297b878)


- Create an elastic IP or EIP address. 


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/8a8746a3-3d0c-4827-bebb-a8e60e95d7fb)


- Go back to the script above and replace "ec2" in both resources with "db" and "web"

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/016aee13-44a9-4601-ba47-33bc6a95f380)


## Step 3: Create a security group for the web server opening ports 80 and 443

- Before creating the security group, let's define 2 variables


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/af0b4530-deca-4fc6-8275-646086dd3f88)

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/508d7b3c-f14e-4414-912f-db7fa3c9d449)


- Now create the security group.

- Add the following script to **main.tf**.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/3500a95a-f9c5-48bd-a487-893b0a10d4cb)



- Copy the same script and change *ingress* by *egress*. Paste it below the previous script in the same file **main.tf**. Also replace *ingress* by *egress* evrywhere in the second snipet of code.

- Go back to **resource "aws_instance" "web"** line, and add security group to it. 

- Next create output Private IP and public IP. Add the code at the end of **main.tf**. Do not forget to make changes to public IP resource. See screeshot below. 

- Now add the bootstrap *user_data* file to resource "aws_instance" "web" under security group.

- Verify everything looks correct and add a provider at the top of **main.tf**. 


## Step 4: Run the provided script on the server

- Go to the terminal. 

- Execute these commands respectively `terraform init`, `terraform apply`

- You may encounter an error when calling user_data. 


#### Voila you've used Terraform to Deploy a web server. 


- 

Here’s a cleaner, professional version of your `README.md` with improved structure, grammar, and formatting. I’ve kept your screenshots but added actual Terraform code blocks so it’s easier for others to follow along.

---

# Using Terraform to Deploy a Web Server

This tutorial walks you through deploying a simple AWS setup using Terraform.
You’ll create a database server, a web server with a fixed IP address, configure security groups, and run a bootstrap script on the web server.

---

## Scenario

As the DevOps engineer on duty, your supervisor has asked you to complete the following tasks:

1. Create a database (DB) server and output its **private IP**.
2. Create a web server with a **fixed public IP**.
3. Create a **security group** for the web server, opening ports **80 (HTTP)** and **443 (HTTPS)**.
4. Run a provided **bootstrap script** on the web server.

---

## Step 1: Create a Database Server and Output Its Private IP

### 1. Create the project folders

* Open **VS Code**.
* Create a folder named `WebServer`.
* Inside it, create another folder named `dbserverchallenge`.

Your structure should look like:

```
WebServer/
└── dbserverchallenge/
```

---

### 2. Add the server script

Inside `dbserverchallenge`, create a file named `server-script.sh` and copy the bootstrap script into it.

Example `server-script.sh`:

```bash
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Hello from the DB Server" > /var/www/html/index.html
```

---

### 3. Create the Terraform configuration

Create a `main.tf` file in the same folder. Add the following Terraform code to launch an EC2 instance for the database server:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "db" {
  ami           = "ami-12345678" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

output "db_private_ip" {
  value = aws_instance.db.private_ip
}
```

---

## Step 2: Create a Web Server with a Fixed Public IP

### 1. Update the instance configuration

Create another EC2 instance for the web server. In your `main.tf`, add:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-12345678" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}
```

---

### 2. Create an Elastic IP

Add the following resource to allocate a fixed public IP for the web server:

```hcl
resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
  vpc      = true
}
```

---

## Step 3: Create a Security Group for the Web Server

We’ll create a security group that allows inbound HTTP (80) and HTTPS (443) traffic.

### 1. Define variables (optional)

Add variables for the ports:

```hcl
variable "http_port" {
  default = 80
}

variable "https_port" {
  default = 443
}
```

---

### 2. Create the security group

Add this to `main.tf`:

```hcl
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = "vpc-12345678" # Replace with your VPC ID

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

---

### 3. Attach the security group to the web server

Update the `aws_instance.web` resource:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_sg.name]

  user_data = file("server-script.sh")

  tags = {
    Name = "Web Server"
  }
}
```

---

### 4. Output the public IP

Add this output at the end of your `main.tf`:

```hcl
output "web_public_ip" {
  value = aws_eip.web_ip.public_ip
}
```

---

## Step 4: Deploy with Terraform

From your terminal, navigate to the project directory and run:

```bash
terraform init
terraform apply
```

Terraform will:

* Initialize the project.
* Deploy your database server, web server, Elastic IP, and security group.

---

## Troubleshooting

If you run into issues with the `user_data` script:

* Double-check that the `server-script.sh` file has executable permissions:

  ```bash
  chmod +x server-script.sh
  ```
* Verify that the file path matches what you reference in Terraform.

---

## Final Result

Once deployed, you will have:

* A database server with a private IP output.
* A web server with a fixed public IP address.
* A security group allowing HTTP and HTTPS traffic.
* A working bootstrap script running on the web server.

---

## Clean Up

To avoid AWS charges, destroy the resources when you're done:

```bash
terraform destroy
```

---

## Summary

You’ve successfully:

1. Built a database server and web server using Terraform.
2. Attached a fixed IP to the web server.
3. Configured security groups for secure traffic.
4. Automated server setup with a bootstrap script.

This setup can be expanded with load balancers, RDS, or auto-scaling for production environments.

---

