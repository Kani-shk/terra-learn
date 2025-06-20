#output "ec2_public_ip" {
 # value = aws_instance.pro_instance[*].public_ip #asterisk for multiple instances mentioned using count meta argument

#}

#output "ec2_public_dns" {
 # value = aws_instance.pro_instance[*].public_dns

#}

#output "ec2_private_ip" {
 # value = aws_instance.pro_instance[*].private_ip

#}

output "ec2_public_ip" {
    value = [
        for instance in aws_instance.pro_instance : instance.public_ip
    ]
  
}

output "ec2_public_dns" {
    value = [
        for instance in aws_instance.pro_instance : instance.public_dns
    ]
  
}

output "ec2_private_ip" {
    value = [
        for instance in aws_instance.pro_instance : instance.private_ip
    ]
  
}