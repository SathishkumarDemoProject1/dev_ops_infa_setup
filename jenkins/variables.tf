variable "aws_region" {
  description = "AWS region to create resources"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC for Jenkins"
  default = "vpc-078b4797e2875031e"
}
