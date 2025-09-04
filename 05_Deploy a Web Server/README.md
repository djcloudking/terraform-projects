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
sudo yum update
sudo yum install -y httpd 
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<H1>Hello from Terraform</H1>" | sudo tee /var/www/html/index.html
```

---


### 3. Create the Terraform configuration

- Create a `main.tf` file in the same folder. 

- Add the Terraform code to launch an EC2 instance for the database server


---

## Step 2: Create a Web Server with a Fixed Public IP

### 1. Update the instance configuration

Create another EC2 instance for the web server in your `main.tf`.


---

### 2. Create an Elastic IP

Add the resource to allocate a fixed public IP for the web server.


---

## Step 3: Create a Security Group for the Web Server

Create a security group that allows inbound HTTP (80) and HTTPS (443) traffic.

### 1. Define variables (optional)

Add variables for the ports


---

### 2. Create the security group

Add the security group to `main.tf`


---

### 3. Attach the security group to the web server

Update the `aws_instance.web` resource by attaching the security group to the web server.


---

### 4. Output the public IP

Add the output at the end of your `main.tf`


### Note

**All the terraform configuration code and other scripts are located in the dbserverchallenge folder.**


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

## Summary

You’ve successfully:

1. Built a database server and web server using Terraform.
2. Attached a fixed IP to the web server.
3. Configured security groups for secure traffic.
4. Automated server setup with a bootstrap script.


