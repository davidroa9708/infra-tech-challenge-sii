resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "codepipelineartifactss3"
}

terraform{
    backend "local" {
    }
}

provider "aws" {
    region = "us-east-2"
    access_key = "AKIAXGERSXORH4GUPYNB"
    secret_key = "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"
}
