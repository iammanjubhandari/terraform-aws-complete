resource "null_resource" "name" {
    depends_on = [module.ec2_public]
    connection {
      type = "ssh"
      host = aws_eip.bastion_eip.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("private-key/terraform-key-us-east-2.pem")
    }


provisioner "file" {
  source = "private-key/terraform-key-us-east-2.pem"
  destination = "/tmp/terraform-key-us-east-2.pem"
}

provisioner "remote-exec" {
  inline = [
    "sudo chmod 400 /tmp/terraform-key.pem"
   ]
}


provisioner "local-exec" {
  command = "echo VPC created on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
  working_dir = "local-exec-output-files/"
}

}