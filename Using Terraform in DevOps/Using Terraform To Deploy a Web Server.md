# Using Terraform To Deploy a Web Server

In this tutorial I will talk about the following scenario:

You are the DevOps engineer on watch. You supervisor asked to implement some resources in the company AWS environment. He asked you: 

    . Create a DB server and output a private IP.
    . Create a web server and ensure it has a fix IP.
    . Create a security group for the web server opening ports 80 and 443 (Http & https).
    . Run the provided script on the server. 


Let's begin:

## Step 1: Create a DB server and output a private IP

- Open VS code.

- Create a folder named **Web Server**. 

- Under that folder, create another folder called **dbserverchallenege**.

- Inside the **dbserverchallenege**, create a file named **server-script.sh**

- Copy the script below in **server-script.sh**. 


.


- Create a **main.tf** file, and add the script below to the file.

.


- Create the ec2 resource. 


.


## Step 2: Create a web server and ensure it has a fix IP

- Copy the same script but replace tag name with **"Web server"**.


.


- Create an elastic IP or EIP address. 


.


- Go back to the script above and replace "ec2" in both resources with "db" and "web"


.


## Step 3: Create a security group for the web server opening ports 80 and 443

- Before creating the security group, let's define 2 variables


.


- Now create the security group.

- Add the following script to **main.tf**.


.


- Copy the same script and change *ingress* by *egress*. Paste it below the previous script in the same file **main.tf**. Also replace *ingress* by *egress* evrywhere in the second snipet of code.


.


- 

## Step 4: Run the provided script on the server