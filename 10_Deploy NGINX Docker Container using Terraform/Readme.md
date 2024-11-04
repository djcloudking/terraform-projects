### Create Terraform Infrastructure with Docker

1- In the "Code Editor" tab, create a **terraform.tf** file.

***This file includes the terraform block, which defines the provider and Terraform versions you will use with this project.***

![image](https://github.com/user-attachments/assets/70b49acf-1172-4474-8d13-aa6da70b306a)


2- Next, create **main.tf** and copy and paste the following configuration.


![image](https://github.com/user-attachments/assets/5ee23de2-3aba-4223-8221-6bdc641cf1cf)



3- Open the terminal, initialize the project, which downloads a plugin that allows Terraform to interact with Docker: **terraform init**


![image](https://github.com/user-attachments/assets/014abfa7-1168-43bb-bc18-d387113869f8)


![image](https://github.com/user-attachments/assets/db2552e3-689d-4739-9af5-4df3a075e341)



4- Provision the NGINX server container with **terraform apply**. When Terraform asks you to confirm, type **yes** and press **ENTER**.


![image](https://github.com/user-attachments/assets/88848fa1-a989-4407-987f-df7f6c4eb810)


5- Verify NGINX instance. Run **docker ps** to view the NGINX container running in Docker via Terraform.


![image](https://github.com/user-attachments/assets/029f04ab-04ff-46d7-8c58-361db990ea88)


You have now provisioned and destroyed an NGINX webserver with Terraform.
