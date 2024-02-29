# Create a VPC with CIDR Range: 192.168.0.0/24


## Launch Visual Studio Code  

- Create a new folder named **vpc_challenge**.

- Under that folder, add a new file. You should name the file **main.tf**.
  

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/87a3196a-65f7-4eaa-a112-106a65a91fa0)


- Add the script needed to create the VPC.
  

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/70879e6f-8cd8-4059-b8d5-72ce37ce6af6)


- Save all.


## Open the terminal

- Locate **vpc_challenege** folder.

- Now execute the following commands in the terminal:

    - `terraform init`
      
 
![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/7a393e83-0d05-47a7-9811-c2ae0f86b043)


    - Verify if the cidr_block is correct, then type Yes.


![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/2e0ce600-72d6-42eb-98d5-1ae09687d129)


- Enter terraform apply


## Verification and Testing

- Now go to the VPC console and look for the VPC you just created.
  

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/5dbb87cc-1e8a-4b5f-8aa4-5e9684759138)


- Verify if resource has all the specifications as you wanted.
  

![image](https://github.com/djcloudking/terraform-challenges/assets/122766532/9dc5a12b-5bc6-4a98-b3fb-4a3ffcf5556e)


##### You have created a VPC with CIDR Block using Terraform. 


