resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc-vinginia-us-east-1.id

  tags = {
    Name = "IGW: For Vinginia US East Project" 
  }
}
