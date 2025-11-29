variable "instance_type" {
  description = "Ec2 Instance type"
  type = string
  default = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 instance"
  type = string
  default = "terraform-key"
}

variable "private_instance_count" {
  description = "AWS EC2 Private Instance Count"
  type = number
  default = 1
}

