data "aws_ami" "amilinux2"{
    most_recent = true
    owners = [ "amazon" ]
    filter {
      name = "name"
      values = [ "amzn2-ami-hvm-*-gp2" ]
    }
    filter {
      name = "root-device-type"
      values = [ "ebs" ]
    }
}