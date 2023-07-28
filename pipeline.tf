resource "aws_codebuild_project" "plan-serverless" {
  name          = "cicd-plan-serverless"
  description   = "Plan stage for terraform"
  service_role  = aws_iam_role.assume_codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }
  source {
    type      = "CODEPIPELINE"
    buildspec = file("buildspec/serverless-buildspec.yml")
  }
}

resource "aws_codepipeline" "serverless_pipeline" {
    name = "serverless_node"
    role_arn = aws_iam_role.assume_codepipeline_role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.codepipeline_artifacts.id
    }
   stage {
        name = "Source"
        action{
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["code"]
            configuration = {
                FullRepositoryId      = "davidroa9708/sii_challenge"
                BranchName            = "main"
                ConnectionArn         = aws_codestarconnections_connection.sii_github_connection.arn
                OutputArtifactFormat  = "CODE_ZIP"
            }
        }
    }

    stage {
        name = "Plan"
        action{
            name = "Build"
            category = "Build"
            provider = "CodeBuild"
            version = "1"
            owner = "AWS"
            input_artifacts = ["code"]
            configuration = {
                ProjectName = "cicd-plan-serverless"
            }
        }
    }
}
