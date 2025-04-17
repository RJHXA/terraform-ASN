terraform {
    backend "s3" {
        bucket         = "rjhxa-gsg-bucket-terraform"
        key            = "terraform/state"
        region         = "us-west-2"
        encrypt        = true
    }
}