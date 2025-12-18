resource "aws_launch_template" "my_launch_template" {
  name = "my-lauch-template"
  description = "My Lauch template"
  image_id = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [ module.private_sg.security_group_id ]
  key_name = var.instance_keypair
  user_data = filebase64("$(path.module)/app1-install.sh")
  ebs_optimised = true

  update_defaut_version = 1
  bloak_device_mapping {
    device_name = "/dev/sda1"
    ebs {
        volume_size = 20
        delete_on_termination = true
        volume_type = "gp2"
    }
    monitoring {
        enabled = true
    }
    tag_specifications {
        tags = {
            Name = "myasg"
        }
    }
  }
