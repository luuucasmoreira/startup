# Startup - Staging

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

![GitHub Org's stars](https://img.shields.io/github/stars/camilafernanda?style=social)

## GIT

Clonar o repositorio em sua maquina utilizando SSH de preferencia (Segurança)
Gerar uma chave em sua maquina com a linha:

$ssh-keygen

Seguir os passos,
Pegar a chave criada, algo igual como ~/.ssh/id_rsa.pub
Colar na tela do git na tela do repositorio:
startup > Settings > Deploy Keys > Add Deploy Key
Dar um nome para essa chave no campo "Title"
Colar a chave no campo "Key"
OBS: Flegar "Allow white access" Apenas se esse usuario precisar acesso de escrita

BRANCH

Criado a branch develop para questões de desenvolvimento da seguinte forma:

## criar

git branch -c develop

## acessar

git checkout develop

## add arquivos

git add .

## commit

git commit -m "Descrever"

## push

git push origin develop

## Mesclar o conteudo da feature (develop) com produção (main)

git checkout main

//sempre checar dando pull nele mesmo

git pull origin main

git merge develop

git commit -m "Descrever"

git push origin main

## Terraform e LocalStack

rodar o comando para iniciar um conteiner contendo o localstack
docker-compose up -d

rodar os comandos para iniciar a criação do bucket e do dynamodb
tflocal init
tflocal apply

OBS:
necessita ter instalado o tflocal conforme documentação do localstack
pip install terraform-local

Main.tf consta toda configuração da aws com o endpont do localstack que seria na porta 4566

resources.tf consta as configurações especificas do bucket e do dynamodb

Rodando os comandos percebemos que ja está em execução o s3 e o dynamodb

aws --endpoint-url=<http://localhost:4566> s3 ls

aws --endpoint-url=<http://localhost:4566> dynamodb table-lists

## AWS CLI

configurar para pegar as chaves como "test"

aws configure

## Kubernets com kind

No terraforms por padrão ele não reconhece o provider do kind e do kubectl então teremos que fazer isso manualmente

vamos criar as pastas

mkdir ~/.terraform.d/plugins/gavinbunney/kubectl/1.14.0/linux_amd64/
mkdir ~/.terraform.d/plugins/gavinbunney/kubectl/1.14.0/linux_amd64/

#Logo em seguida, devemos fazer o dowload e a descompactação dos arquivos manualmente

cd ./.terraform.d/plugins/gavinbunney/kubectl/1.14.0/linux_amd64

wget https://github.com/gavinbunney/terraform-provider-kubectl/releases/download/v1.14.0/terraform-provider-kubectl_1.14.0_linux_amd64.zip

unzip terraform-provider-kubectl_v1.14.0.zip

rm terraform-provider-kubectl_v1.14.0.zip

#mesmo procedimento com o kind

cd ./.terraform.d/plugins/techyx/kind/0.5.1/linux_amd64

wget https://github.com/tehcyx/terraform-provider-kind/releases/download/v0.5.1/terraform-provider-kind_0.5.1_linux_amd64.zip

unzip terraform-provider-kind_0.5.1_linux_amd64.zip

rm terraform-provider-kind_0.5.1_linux_amd64.zip

## configurando para poder pegar o diretorio correto

criar um arquivo chamado .terraformrc e apontar aonde vai ser lido os providers

provider_installation {

  filesystem_mirror {
  
    path = "~/.terraform.d/plugins"
    
  }
  
  direct {
  
    exclude = ["*"]
    
  }
  
}


#OBS:
precisei deletar algumas vezes o .terraform para que iniciace o tflocal sem cache

