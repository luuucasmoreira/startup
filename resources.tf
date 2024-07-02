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

#Kubertenes com kind
resource "null_resource" "kind_cluster" {
  provisioner "local-exec" {
    command = "kind create cluster --config=kind-config.yaml"
    working_dir = path.module
  }

  provisioner "local-exec" {
    when    = destroy
    command = "kind delete cluster"
    working_dir = path.module
  }
}

output "kubeconfig" {
  value = "Kubeconfig gerado para o cluster Kind." #output de saida
}
