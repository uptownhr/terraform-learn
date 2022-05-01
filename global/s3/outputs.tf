output "s3_bucket_arc" {
  value = aws_s3_bucket.terraform_state.arn
  description = "The Terraform state backend S3 bucket"
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
  description = "The Terraform state change lock management database"
}
