# Setting up EC2 using Terraform.


## Step 1: Gather details for our EC2

- Log in to AWS console

- Go to EC2 dashboard.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/51fff0f7-67ae-4c32-b471-607e54054469)


- Click on Launch instance.

- Click on Amazon Linux 2 AMI, and select Free Tier eligible Amazon Linux 2023 AMI.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/b54ad2e4-1e09-43c7-8d66-10668460a934)


- At your right side, copy the AMI number and exit the page. 


## Step 2: Create EC2 instance

- Open Visual Studio Code.  

- Create a folder called **EC2**

- Create a file named **main.tf**


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/df6fe968-cafd-494a-ad0c-b046726645c7)


- Write the following script:

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/db3c65dc-f712-4408-8c8b-c13c4c5f79b7)


- Now open the terminal and execute these commands respectively:

    - `cd EC2`

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/c046d2b8-49e7-483a-a60f-85ab828e950c)


    - `terraform init`


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/514d4fa9-2a87-4de4-ab3a-064a1dd5cd4a)


    - `terraform apply`


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/91c45b25-2d9e-40d6-8905-21eae2c5e620)


    - Verifiy if AMI number is correct
    
    
    ![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/68eb41b2-9c49-48f4-a037-dc29f1505e4b)

    
    - Then type `Yes`


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/64bdfcc1-d865-4258-a0f9-fef86b861477)


## Step 3: Verification and Test

- Return to EC2 console and verify the changes. You should be able to see your EC2.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/9397a096-7da6-4a88-9d56-aeccd5cd6c17)


- Check if all EC2 resources are up-to-date.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/099a08dd-815f-42e1-9ac2-ae6544400ca9)


##### Voila! You've created EC2 instance using Terraform. 


