terraform {
  backend “s3” {
    bucket         = “ape-terraform-state-bucket”
    key            = “global/s3/terraform.tfstate”  # Path in S3 where the state file will be stored
    region         = “us-west-2"
    encrypt        = true                           # Enables server-side encryption
    dynamodb_table = “terraform-locks”      # Name of the DynamoDB table for state locking
  }
}


resource "null_resource" "test" {
  triggers = {
    always_run = timestamp()
  }
}
