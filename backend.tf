terraform {
  backend "s3" {
    bucket         = "abdelrahmanrefaat952405"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "refaat-state-lock"
  }
}
