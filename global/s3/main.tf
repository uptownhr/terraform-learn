/*terraform {
  backend "s3" {
    bucket = "james-terraform-example-state-x"
    key =  "global/s3/terraform.tfstate"
    region = "us-east-2"
    profile = "james"

    dynamodb_table = "james-terraform-example-locks"
    encrypt = true
  }
}*/

provider "aws" {
  region = "us-east-2"
  profile = "james"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "james-terraform-example-state-x"

  lifecycle {
    prevent_destroy = true
  }

  // force_destroy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "james-terraform-example-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  lifecycle {
    // prevent_destroy = true
  }

  attribute {
    name = "LockID"
    type = "S"
  }
}
