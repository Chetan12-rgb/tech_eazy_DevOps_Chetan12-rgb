# ELB DNS to access the app via Load Balancer
output "elb_dns_name" {
  description = "DNS name of the Load Balancer"
  value       = aws_elb.app_elb.dns_name
}

