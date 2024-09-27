terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
}




resource "null_resource" "test" {
  triggers = {
    always_run = timestamp()
  }
}
