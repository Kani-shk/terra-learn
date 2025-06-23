module "vpc" {
    source = "terraform-vpc-modules/vpc/aws"

    name = "auto-vpc"
    cidr = "10.0.0.0/16"

    azs = ["us-east-2a" , "us-east-2b"]
    public_subnet = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet = [ "10.0.101.0/24", "10.0.102.0/24"]
  
  enable_nat_gateway = true 
  enable_vpn_gateway = true 

tags {
    terraform = true
        Environment = var.env
}
}