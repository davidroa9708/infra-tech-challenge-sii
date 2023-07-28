resource "aws_codestarconnections_connection" "sii_github_connection" {
  name          = "github_connection"
  provider_type = "GitHub"
}