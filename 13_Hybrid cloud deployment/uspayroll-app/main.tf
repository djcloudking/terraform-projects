module "us-payroll" {
    source = "../modules/payroll-app"
    app_region = "us-west-1"
    ami = "ami-038bba9a164eb3dc1" 
}