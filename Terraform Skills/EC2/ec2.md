# Setting up EC2 using Terraform

## Step 1: Gather details for our EC2

- Log in to AWS console

- Go to EC2 Console.

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/51fff0f7-67ae-4c32-b471-607e54054469)


- Click on Launch instance.

- Click on Amazon Linux 2 AMI, and select Free Tier eligible Amazon Linux 2023 AMI.

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/b54ad2e4-1e09-43c7-8d66-10668460a934)


- At your right side, copy the AMI number and exit the page. 


## Step 2: Create EC2 instance

- Open Visual Studio Code.  

- Create a folder called **EC2**

- Create a file named **main.tf**

- Write the following script

- Open terminal and execute these commands:

    - cd EC2

    - terraform init

    - terraform apply

    - Then type Yes

## Step 3: Verification and Test

- Return to EC2 console and verify the changes. You should be able to see your EC2

- After verification, you can delete your EC2 resource by using terraform destry. 


