# Setting up EC2 using Terraform

### Log in to AWS console

- Go to EC2 Console

- Click on Launch instance.

- Click on Amazon Linux 2 AMI, and select Free Tier eligible Amazon Linux 2023 AMI. 

- At your right side, copy the AMI number and exit the page. 


### Open Visual Studio Code or another code editor

- Create a folder called EC2

- Create a file named main.tf

- Write the following script

- Open terminal and execute these commands:

    - cd EC2

    - terraform init

    - terraform apply

    - Then type Yes

### Verification and Test

- Return to EC2 console and verify the changes. You should be able to see your EC2

- After verification, you can delete your EC2 resource by using terraform destry. 


