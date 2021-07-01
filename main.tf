terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.47.0"
    }
  }
}

#----------storage/main.tf-------

provider "aws" {
  region = "ap-south-1"
}

variable "project_name" {
	type = string 
   default = "ibm-terraform-bucket-jagan"
}

# Create the bucket

resource "aws_s3_bucket" "tf_code" {
  bucket        = random_id.tf_bucket_id.dec
  acl           = "private"
  force_destroy = true

  tags = {
    Name = "tf_bucket"
  }
}
