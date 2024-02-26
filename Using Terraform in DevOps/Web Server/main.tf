

resource "aws_instance" "ec2" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"  

     tags = {
        Name = "DB Server"
    } 
}

resource "aws_instance" "ec2" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro" 
    
    tags = {
        Name = "Web Server"
    } 
}