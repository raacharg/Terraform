provider "aws" {
  region = "eu-central-1"
}

terraform {
    backend "s3" {
        bucket  = "raacharg-tfstate"
        key     = "dev/network/terraform.tfstate"
        region  = "eu-central-1"
    }
}
