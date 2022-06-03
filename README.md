# Networking with Terraform
## Assignment 03 - Networking - Jalasoft DevOps Bootcamp

### This Project was made with the main intention of implement the learned features about Subnetting: 

The Project Has been builded with Terraform to allow the User to set up a Virtual Private Cloud ( VPC ) on Amazon Web Services ( AWS ). This VPC includes 4 
Elastic Compute Cloud Web Services ( EC2 ), wich basically are virtual machines that represents physical servers for deploying applications.


 * Schema of the AWS structure:
 

![schema](https://user-images.githubusercontent.com/82456534/171851084-bf2e5dc4-a468-4443-a27b-aec88a5589f7.png)




## Subnetting:
   To ensure communications between each EC2, a Subnet Mask has to been declared for each Subnet, where IP ranges are declared specifying the 
   amount of HOST contained on every Subnet. In this particular Project we're building the structure as follows:
   
   *  Office 1: 80 Host  - Private Subnet
   *  Office 2: 500 Host - Private Subnet
   *  Office 3: 40 Host - Private Subnet
   *  Office 4: 30 Host - Public Subnet


![subnetting](https://user-images.githubusercontent.com/82456534/171849689-6cc41f81-7515-487f-9f89-557eb65467b9.png)

   Having created the Subnet Masks, now we can set the Subnets for each EC2 in AWS.
   

## Terraform Structure
   
   *  Provider.tf file :  Its were we set the Provider that will build our VPC, setting the zone where it will be ( us-east-1 )
   *  Main.tf file : Where the Subnets are defined, besides the Internet Gateway, The Route and Association Tables
   *  Ec2.tf file :  Definition of each EC2, heading to its corresponding Subnet and Security Group
   *  Security.tf file: Where Security Groups are declared: A private one containing Subnets 1, 2 and 3; and a Public one for Subnet 4
   *  Dockerfile file: To ensure that every User can get the same Development Enviroment in case of needs


## Build Instructions

   IMPORTANT!!!
   To ensure best coding practices, the file containing the access aws key  has been not provided. You must use your own AWS key.
   
   1) Create a new folder on your Computer ( Folder name is up to you )
   2) Open the folder with Visual Studio
   3) Clone this Repository
   4) Reopen the project in the Container when VStudio prompt for it
   5) Open a new terminal, and enter the command: $Terraform init
   6) Next, enter the command: $Terraform plan -out mgmain.tfplan
   7) Then,enter the command: $Terraform apply mgmain.tfplan  ( The project structure will be created in AWS )
   8) Log in to AWS, you can now see a VPC named mgmain has been created, check for the office4_ec2 public ip
   9) Move to the folder where your AWS Credentials are ( KP.pem file )
   10) Open a new Linux terminal and enter : ssh -i <YOUR AWS KEY> ubuntu@<office4_ec2 public ip> and hit enter
   11) You re now connected to the Office4 Ec2
   12) To check communication with private EC2's, you will need to check their private IP's on AWS, and enter the command $ping <private_ip> on your console
   
