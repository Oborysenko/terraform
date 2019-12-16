terraform {
  required_version = "~> 0.10"
  backend "s3" {
    bucket                 = "geniusee"
    region                 = "us-east-1"
    key                    = "backend.tfstate"
#    workspace_key_prefix   = "terraform"
    dynamodb_table         = "terraform-lock"
  }
}
