variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = ""  
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}

variable "key_pair" {
    description = "Name of the key pair to use for the EC2 instance"
    type        = string
    default = ""
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = ""
}

