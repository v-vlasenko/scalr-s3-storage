# Configure the backend with S3 and DynamoDB for state locking
locals {
  bucket_name = "ape-terraform-state-bucket"
  dynamodb_table_name = "terraform-locks"
}


terraform {
  backend "s3" {
    bucket         = local.bucket_name
    key            = "global/s3/terraform.tfstate"  # Path in S3 where the state file will be stored
    region         = "us-west-2"
    encrypt        = true                           # Enables server-side encryption
    dynamodb_table = local.dynamodb_table_name      # Name of the DynamoDB table for state locking
  }
}

resource "null_resource" "test" {
  triggers = {
    always_run = timestamp()
  }
}
