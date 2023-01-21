provider "aws" {
    region = "eu-central-1"
}

terraform {
    backend "s3" {
        bucket  = "raacharg-tfstate"
        key     = "dev/data-sources/terraform.tfstate"
        region  = "eu-central-1"
    }
}

data "aws_availability_zones" "azones" {}
data "aws_caller_identity" "account" {}
data "aws_region" "current" {}
data "aws_vpcs" "my_vpcs" {}

data "aws_ami" "latest_amazon_linux" {
    owners      = ["137112412989"]
    most_recent = true
    filter {
        name    = "name"
        values   = ["amzn2-ami-kernel-*-x86_64-gp2"]
    }
}


output "latest_amazon_linux_id" {
    value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_linux_name" {
    value = data.aws_ami.latest_amazon_linux.name
}


output "aws_region_descr" {
    value = data.aws_region.current.name
}

output "availability_zones" {
    value = data.aws_availability_zones.azones.names
}

output "account_id" {
    value = data.aws_caller_identity.account.account_id
}

output "aws_vpcs" {
    value = data.aws_vpcs.my_vpcs.ids
}
