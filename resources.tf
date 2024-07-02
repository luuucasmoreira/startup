resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}

resource "aws_dynamodb_table" "us-east-1" {
  name           = "Logs"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LogsId"
  attribute {
    name = "LogsId"
    type = "S" #(S) String , (N) Number, (B) Binary
  }
  tags = {
    name = "Logs DynamoDB Table"
    Enviroment = "Testing"
  }
}
