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



#Configs do Kind
resource "kind_cluster" "default" {
    name = "test-cluster"
    node_image = "kindest/node:v1.27.1"
    whait_for_ready = true

    kind_config {
      kind        = "Cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node {
          role = "control-plane"
        }
      node {
        role = "worker"
      }
      node {
        role = "worker"
      }
    }
}