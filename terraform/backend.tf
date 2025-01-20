## backend.tf (Optional: Store Terraform state remotely in S3)
terraform {
  backend "s3" {
    bucket         = "devopsprojects3gigi"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}