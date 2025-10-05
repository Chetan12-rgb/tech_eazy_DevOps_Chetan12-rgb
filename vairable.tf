#AWS Region
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}

# EC2 Instance details
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-02d26659fd82cf299"
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name to SSH into the instance"
  type        = string
  default = "ThisIsKey"
}

#S3 Bucket for ELB logs
variable "bucket_name" {
  description = "Name of the S3 bucket for ELB logs"
  type        = string
  default = "thisismybucketareyaarlelena2024"
}
variable "instance_count" {
  description = "EC2 instance Count"
  type        = number
  default     = 3
}



