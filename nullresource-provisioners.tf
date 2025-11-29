resource "null_resource" "name" {
    depends_on = [module.ec2_public]
    connection {
      type = "ssh"
      host = aws_eip.bastion_eip.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("private-key/terraform-key.pem")
    }

}