# Using Terraform To Deploy a Web Server

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
