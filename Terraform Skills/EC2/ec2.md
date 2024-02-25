# Setting up EC2 using Terraform

### Log in to AWS console

- Go to EC2 Console.

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/51fff0f7-67ae-4c32-b471-607e54054469)


- Click on Launch instance.

- Click on Amazon Linux 2 AMI, and select Free Tier eligible Amazon Linux 2023 AMI.

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/b54ad2e4-1e09-43c7-8d66-10668460a934)


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


