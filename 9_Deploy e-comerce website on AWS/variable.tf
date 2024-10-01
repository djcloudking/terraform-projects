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
