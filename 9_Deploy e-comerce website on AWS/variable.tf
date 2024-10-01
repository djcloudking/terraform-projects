# create variables

# vpc variables
variable "vpc_cidr" {
    default = "15.0.0.0/16"
    description = "vpc cidr block"
    type = string  
}

# create public subnet variables az1
variable "public_subnet_az1_cidr" {
    default = "10.0.0.0/24"
    description = "public subnet az1 cidr block"
    type = string
}

# create public subnet variables az2
variable "public_subnet_az2_cidr" {
    default = "10.0.1.0/24"
    description = "public subnet az2 cidr block"
    type = string
}

# create variables private app subnet  az1
variable "private_subnet_az1_cidr" {
    default = "10.0.2.0/24"
    description = "private app subnet az1 cidr block"
    type = string
}

# create variables private app subnet az2
variable "private_subnet_az2_cidr" {
    default = "10.0.3.0/24"
    description = "private app subnet az2 cidr block"
    type = string
}

# create variables private data subnet az1
variable "private_data_subnet_az1_cidr" {
    default = "10.0.4.0/24"
    description = "private data subnet az1 cidr block"
    type = string
}

# create variables private data subnet az2
variable "private_data_subnet_az2_cidr" {
    default = "10.0.5.0/24"
    description = "public data subnet az2 cidr block"
    type = string
}
