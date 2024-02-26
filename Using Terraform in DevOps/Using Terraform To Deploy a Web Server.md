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


-  

## Step 3: Create a security group for the web server opening ports 80 and 443

## Step 4: Run the provided script on the server