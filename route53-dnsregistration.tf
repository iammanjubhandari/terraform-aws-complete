resource "aws_route53_record" "defailt_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name = "myapps.iammanjubhandari.com"
  type = "A"
  alias {
    name = module.alb.dns_name
    zone_id = module.alb.zone_id
    evaluate_target_health = true
  }
}