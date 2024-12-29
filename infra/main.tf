terraform {
  backend "s3" {
    bucket                  = "terraform-state-file-testproject"
    dynamodb_table          = "terraform-locks"
    key                     = "terraform.tfstate"
    region                  = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "frontend_hosting" {
  bucket = "shfdzscgdsvfedasdfbahebf"
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = {
    Environment = "test"
    Project     = "test"
  }
}

resource "aws_s3_bucket_ownership_controls" "frontend_ownership" {
  bucket = aws_s3_bucket.frontend_hosting.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_policy" "frontend_policy" {
  bucket = aws_s3_bucket.frontend_hosting.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "s3:GetObject"
        Effect    = "Allow"
        Principal = "*"
        Resource  = "${aws_s3_bucket.frontend_hosting.arn}/*"
      }
    ]
  })
}