# Startup - Staging
![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)
![GitHub Org's stars](https://img.shields.io/github/stars/camilafernanda?style=social)

GIT

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

#criar
git branch -c develop 

#acessar
git checkout develop

