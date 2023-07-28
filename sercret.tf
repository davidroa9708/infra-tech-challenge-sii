resource "aws_secretsmanager_secret" "mongo_uri_secret" {
  name = "sii_mongo_uri_secret"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "sercret_mongo_uri_version" {
  secret_id = aws_secretsmanager_secret.mongo_uri_secret.id
  secret_string = var.mongo_uri
}


resource "aws_secretsmanager_secret" "the_movie_api_key_secret" {
  name = "sii_the_movie_api_key_secret"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "sercret_the_movie_api_key_version" {
  secret_id = aws_secretsmanager_secret.the_movie_api_key_secret.id
  secret_string = var.the_movie_api_key
}
