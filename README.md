# DAC_Projeto
Projeto final de Desenvolvimento de Aplicações Corporativas - UFPR

Este repositório contém apenas arquivos de desenvolvimento. Para que você os adicione ao seu projeto local (já configurado, usando NetBeans), crie os projetos com os mesmos nomes fornecidos neste repositório e clone o projeto dentro da pasta raíz, onde os repositórios se encontram.

### Instalando o git
```
Abra o Bash do Ubuntu no Windows 10:

sudo apt-get update
sudo apt-get install git
```

### Configurando o arquivo gitignore
```
sudo apt-get update
sudo apt-get install nano

git config --global core.excludesfile ~/.gitignore 
nano ~/.gitignore

Adicionar as seguintes linhas ao arquivo aberto: 

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
```
Crie os projetos com os seguintes nomes: 
alwaystogether
foreveralone
```

### Configurando o versionamento dos projetos
```
cd ../../mnt/c/Users/"SEU USUÁRIO"/"CAMINHO DOS PROJETOS"

git init

git remote add origin https://github.com/lgehlen/DAC_Projeto.git
git fetch origin master
git merge origin/master
```
