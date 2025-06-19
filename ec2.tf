#key pair (login)
resource "aws_key_pair" deployer_key {
    key_name = "Terra-key-ec2"
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOj4QTdJHufOLSAdG0+O8+Pc25SRjY6C3azYhfv1v32q kanishk@kanishk"
  
}
#vpc (security group)
resource "aws_default_vpc" default{
     tags = {
    Name = "Default VPC"
  }
}
resource "aws_security_group" sec_grp{
    name = "automate sg"
    description = "this will add a terraform generated security group"
    vpc_id = aws_default_vpc.default.id #interpolation(extraction or inheritance of a specific terraform data block)
    tags = {
        name = "automate sg"
    }
    #inbound rules
     ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH open"
     }
     ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP open"
     }
     ingress {
      from_port = 8000
      to_port = 8000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "notes app flask"
     }
    #outbound rules
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "access for all outbound"
    }
}
#ec2 (instance)
resource "aws_instance" "pro_instance" {
  key_name = aws_key_pair.deployer_key.key_name
  security_groups = [ aws_security_group.sec_grp.name ]
  instance_type = var.ec2_instance_type
  ami = var.ec2_ami_id #ubuntu
  
  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
}
  tags = {
    name = "kanishk-instance"
  }



}