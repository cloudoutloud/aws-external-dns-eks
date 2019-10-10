#If you need to register a new domain 
resource "aws_route53_record" "test" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = ""
  type    = "A"
  ttl     = "300"
}

#If you have existing domain name only create the hosted zone and add existing domain name
resource "aws_route53_zone" "primary" {
name = ""
}

output "ns-servers" {
value = "${aws_route53_zone.primary.name_servers}"
}