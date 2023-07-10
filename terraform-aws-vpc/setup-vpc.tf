resource "aws_vpc" "vpc-vinginia-us-east-1" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "VPC: vpc-vinginia-us-east-1"
  }
}
