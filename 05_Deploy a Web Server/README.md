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

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/80bfcb77-a4d6-498a-bf8a-d0561cb3f17a)


### 3. Create the Terraform configuration

Create a `main.tf` file in the same folder. Add the following Terraform code to launch an EC2 instance for the database server:

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/cd0fa240-3d7e-4aaf-beed-4ece6c066c0a)


---

## Step 2: Create a Web Server with a Fixed Public IP

### 1. Update the instance configuration

Create another EC2 instance for the web server. In your `main.tf`, add:

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/a6811b7c-e94e-41c1-9f1f-25098297b878)


---

### 2. Create an Elastic IP

Add the following resource to allocate a fixed public IP for the web server:

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/8a8746a3-3d0c-4827-bebb-a8e60e95d7fb) 


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/016aee13-44a9-4601-ba47-33bc6a95f380)


---

## Step 3: Create a Security Group for the Web Server

We’ll create a security group that allows inbound HTTP (80) and HTTPS (443) traffic.

### 1. Define variables (optional)

Add variables for the ports:

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/af0b4530-deca-4fc6-8275-646086dd3f88)

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/508d7b3c-f14e-4414-912f-db7fa3c9d449)


---

### 2. Create the security group

Add this to `main.tf`:


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/3500a95a-f9c5-48bd-a487-893b0a10d4cb)


---

### 3. Attach the security group to the web server

Update the `aws_instance.web` resource.


---

### 4. Output the public IP

Add this output at the end of your `main.tf`


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


