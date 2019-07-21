provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "helm_repo" {
  bucket_prefix = "helm-chart-repository"
  acl           = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Owner           = "MyTeam"
    ApplicationRole = "ArtifactRepository"
  }
}

resource "aws_s3_bucket_public_access_block" "helm_repo_access_rules" {
  bucket = aws_s3_bucket.helm_repo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket_prefix = "terraform-state-bucket"
  acl           = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Owner           = "MyTeam"
    Project         = "Infra"
    ApplicationRole = "ArtifactRepository"
    stage           = "test"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_access_rules" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
