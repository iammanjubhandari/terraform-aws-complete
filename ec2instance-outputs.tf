output "ec2_bastion_public_instance_ids" {
  description = "EC2 instance ID"
  value = module.ec2_public.id
}

output "ec2_bastion_public_instance_ids" {
  description = "EC2 instance ID"
  value = module.ec2_public.public_ip
}

#App 1 - Private EC2 instance
output "app1_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value = [for ec2private in module.ec2_private_app1: ec2private.id]
}
output "app1_ec2_private_ip" {
  description = "List of IDs of instances"
  value = [for ec2private in module.ec2_rpivate: ec2private.id]
}


# App2 - Private EC2 Instances

output "app2_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value = [for ec2private in module.ec2_private_app2: ec2private.id ]  
}

output "app2_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value = [for ec2private in module.ec2_private_app2: ec2private.private_ip]
}

#App 3 - Private EC2 instance
output "app3_ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value = [for ec2private in module.ec2_private_app3: ec2private.id]
}
