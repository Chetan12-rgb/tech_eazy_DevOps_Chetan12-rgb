output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = "http://${aws_instance.java_app.public_ip}:8080/hello"
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for logs"
  value       = aws_s3_bucket.logs_bucket.bucket
}
