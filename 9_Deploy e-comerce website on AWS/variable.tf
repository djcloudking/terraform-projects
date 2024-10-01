# create variables

# vpc variables
variable "vpc_cidr" {
    default = "15.0.0.0/16"
    description = "vpc cidr block"
    type = string  
}