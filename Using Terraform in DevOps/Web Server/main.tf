

resource "aws_instance" "db" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"  

     tags = {
        Name = "DB Server"
    } 
}

resource "aws_instance" "web" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro" 
    
    tags = {
        Name = "Web Server"
    } 
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}

variable "ingress" {
    type = list(number)
    default = [ 80, 443 ]
}

variable "egress" {
    type = list(number)
    default = [ 80, 443 ]
}