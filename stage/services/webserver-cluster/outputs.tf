output "alb_dns_name" {
  value = aws_lb.example.dns_name
  description = "the domain name of load balancer"
}
