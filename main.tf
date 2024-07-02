terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws"{
  region = "us-east-1"
  alias  = "accepter"
  access_key = "test" #Necessario para o localstack
  secret_key = "test" #Necessario para o localstack 
  skip_credentials_validation = true #Desabilitar a validação de credencial
  skip_metadata_api_check = true     #Desabilitar a validação de credencial
  skip_requesting_account_id = true  #Desabilitar a validação de credencial
  
  endpoints {
    s3 = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
  }
}