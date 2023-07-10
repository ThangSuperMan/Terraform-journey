data "aws_subnet" "public_subnet" {
    filter {
        name = "tag:Name"
        values = ["Subnet-Public : Public Subnet 1"]
    }

    depends_on = [
        aws_route_table_association.public_subnet_asso
    ]
}

resource "aws_instance" "ec2_example" {
    ami           = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    tags = { 
        Name = "EC2 Public subnet 1"
    }
    # Maybe this one subnet-020374e21cf4ae149 ???
    subnet_id     = data.aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.sg_vpc_vinginia_us_east_1.id]
    key_name      = "aws_key"
}

resource "aws_key_pair" "deployer" {
    key_name   = "aws_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChhcg7xBit5j03js2f3PJWXe07P3o7e3JbOLrI4l92yGAaiHURhrQf0FtILbK7rq+hoIfJxGOX02rvZkmLtiuY2nohlzxvVCbM7bujensM3iUrtqzaMJf0WE1l2xq2KtCaxRV1k+VL5Jpp7ybeD3kZdx6FfNMztnYBYHMTn3zBD1tCr/7m4UFFnr8tqog7zBZzLOBGznDi47kc3CYsr4d5GpLEP52/QCfJaeQPteAIoaWmhERLjWy04PRTofGQ39qctXFyPhfktN+dKzSPeuMOhcB5RoU/SvEFcb/srsAkLJsduGx/pm9sGu9BUGU0B2MiBzvBEKKpdvkHeYRMvPUx thangphan@Phans-MacBook-Pro.local"
}

output "fetchd_info_from_aws" {
    value = format("%s%s", "ssh -i /Users/thangphan/keys/key-for-demo ubuntu@", aws_instance.ec2_example.public_dns)
}
