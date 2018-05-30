# DAC_Projeto
Projeto final de Desenvolvimento de Aplicações Corporativas - UFPR

Este repositório contém apenas arquivos de desenvolvimento. Para que você os adicione ao seu projeto local (já configurado, usando NetBeans), crie os projetos com os mesmos nomes fornecidos neste repositório e clone o projeto dentro da pasta raíz, onde os repositórios se encontram.

### Instalando o git
Abra o Bash do Ubuntu no Windows 10 e instale o git:
```
sudo apt-get update
sudo apt-get install git
```

### Configurando o arquivo gitignore
Instale o nano (ou outro editor à sua disposição):
```
sudo apt-get update
sudo apt-get install nano
```
Configure o gitignore no seu git local e crie um novo arquivo gitignore
```
git config --global core.excludesfile ~/.gitignore 
nano ~/.gitignore
```
Adicionar as seguintes linhas ao arquivo gitignore aberto: 
```
/alwaystogether/build/*
/alwaystogether/dist/*
/alwaystogether/nbproject/*
/alwaystogether/src/conf/*
/alwaystogether/test/*
/alwaystogether/web/META-INF/*
/alwaystogether/web/WEB-INF/*
/foreveralone/build/*
/foreveralone/dist/*
/foreveralone/nbproject/*
/foreveralone/src/conf/*
/foreveralone/test/*
/foreveralone/web/META-INF/*
/foreveralone/web/WEB-INF/*
```

### Nome dos projetos
Crie os projetos com os seguintes nomes: 
```
alwaystogether
foreveralone
```

### Configurando o versionamento dos projetos
Inicie o versionamento do projeto no local onde os projetos já existem:
```
cd ../../mnt/c/Users/"SEU USUÁRIO"/"CAMINHO DOS PROJETOS"

git init
```
Adicione o repositório do projeto:
```
git remote add origin https://github.com/lgehlen/DAC_Projeto.git
git fetch origin master
git merge origin/master
```

### Bibliotecas necessárias para o projeto
Você pode baixar os arquivos necessários para funcionalidade do projeto neste link:
https://drive.google.com/file/d/1cNlZvRILFI8ZCnV7I573nbwftEYLVFOV/view

### Preparar versionamento para desenvolvimento
Cada desenvolvedor possui uma branch de desenvolvimento com o seu nome. Para acessar esta branch:
```
git fetch origin
git checkout seunome
```
Para atualizar sua branch com o mais recente desenvolvido:
```
git merge origin/develop
```

### Realizar upload dos desenvolvimento realizado
Realize o commit do trabalho realizado
```
git status (para visualizar os arquivos modificados - em vermelho)
git add caminho/do/arquivo (realize essa etapa para todos os arquivos em vermelho que deseja adicionar - caso deseje adicionar todos os arquivos em vermelho, utilize o comando "git add .")

git commit -m "Mensagem do commit, entre aspas duplas"

git push (entre com o seu usuário e senha do gitHub)
```
### Restaurar versão de arquivos modificados
Caso mexeu indevidamente em um arquivo e deseja restaurar a versão anterior, realize os seguintes passos:
```
git status (encontre o arquivo que deseja)
git checkout -- caminho/do/arquivo
```
