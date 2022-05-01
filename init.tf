terraform {
  backend "s3" {
    bucket = "james-terraform-example-state-x"
    key =  "global/s3/terraform.tfstate"
    region = "us-east-2"
    profile = "james"

    dynamodb_table = "james-terraform-example-locks"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-2"
  profile = "james"
}
