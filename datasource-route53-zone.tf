data "aws_route53_zone" "mydomain" {
  name = "iammanjubhandari.com"
}

output "mydomain_zoneid" {
  description = "The Hosted id of the desired Hosted ZONE"
  value = data.aws_route53_zone.mydomain.zone_id
}

output "mydomain_name" {
    description = "The Hosted Zone name of the desired Hosted ZONE"
    value = data.aws_route53_zone.mydomain.name
}