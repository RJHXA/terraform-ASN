terraform {
    backend "s3" {
        bucket         = "rjhxa-gsg-bucket-terraform"
        key            = "terraform/state"
        region         = "us-east-1"
        encrypt        = true
    }
}