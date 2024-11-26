module "us-payroll" {
    source = "../modules/payroll-app"
    app_region = "eu-west-2"
    ami = "ami-0c76bd4bd302b30ec" 
}