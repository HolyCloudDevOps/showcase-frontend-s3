terraform {
  backend "s3" {
    bucket                  = "terraform-state-file-testproject "
    dynamodb_table          = "terraform-locks"
    key                     = "${var.env}/terraform.tfstate"
    region                  = var.region
  }
}

provider "aws" {
  region = var.region
}
