provider "aws" {}

variable cidr_block {
    description = "cidr block for vpc and subnet"
}

resource "aws_vpc" "development-vpc" {
    cidr_block = var.cidr_block[0].cidr-block
    tags = {
        Name = var.cidr_block[0].name
    }
}

resource "aws_subnet" "dev-subnet" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.cidr_block[1].cidr-block
    availability_zone = "us-east-1a"
    tags = {
        Name = var.cidr_block[1].name
    }
}
