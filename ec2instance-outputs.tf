output "ec2_bastion_public_instance_ids" {
  description = "EC2 instance ID"
  value = module.ec2_public.id
}

output "ec2_bastion_public_instance_ids" {
  description = "EC2 instance ID"
  value = module.ec2_public.public_ip
}

output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value = [for ec2private in module.ec2_rpivate: ec2private.id]
}

output "ec2_private_ip" {
  description = "List of private IP address assigned to the instance"
  value = [for ec2private in module.ec2_private: ec2private.private.ip]
}