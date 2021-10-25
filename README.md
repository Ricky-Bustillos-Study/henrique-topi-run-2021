# Projeto Base Topi Run 2021
----
Após ter clonado esse repositório, vc pode mesclá-lo com o seu projeto.

Ele já te fornece uma estrutura básica, com alguns pontos que vimos em aula.

Para enviar as classes do projeto para sua Org Salesforce você pode seguir o passo a passo abaixo

# Instalação
--------
Você deve clonar a versão inicial antes do commit f3ca7c8 "Aula 6,7,8". O hashcode dessa versão que você deve clonar é #e3c6125

## Como clonar e configurar seu repo
-------
```
# clonando o repo na última versão
git clone https://github.com/topinformation-public/topi-run-base-project.git

# entrando no diretório clonado
cd ./topi-run-base-project.git

# alternando o repo na versão mais antiga (inicial)
git checkout e3c6125

# apontando o remote do repositório local para seu repositório
git remove set-url origin https://github.com/seuNickname/seuRepo.git

# verificar se o remote realmente atualizou (deve apresentar seu repo)
git remote -v

# resolvendo o HEAD detached do git
# criando sua a branch main a partir da atual
git branch main

# alteranando o repo local para a branch main recém criada
git checkout main

# subindo a branch main no seu repo do github
# caso não funcione, tente apenas "git push"
git push -u origin main


```
## Configurando o ambiente salesforce
-------
**PS:** `my-sandbox` é o apelido que você quer dar para sua Organização Salesforce

1. Crie um arquivo sfdx-project.json com as configurações:
```json
{
  "packageDirectories": [
    {
      "path": "force-app",
      "default": true
    }
  ],
  "name": "my-sandbox",
  "namespace": "",
  "sfdcLoginUrl": "https://login.salesforce.com",
  "sourceApiVersion": "52.0"
}
```

2. Instancie o projeto
    - Pressione F1 ou Ctrl + Shift + P no vscode
    - Selecione SFDX: Create project
    - Atualize seu vscode para carregar as extensões do salesforce 
        - F1 ou Ctrl + Shift + P e selecione "Developer: Reload Window"
 
3. Autentique o projeto com sua Developer Org. do Salesforce (há 2 maneiras de fazer isso)
``` bash
# autentique-se com sua Developer Org.
sfdx force:auth:web:login -a my-sandbox --instanceurl https://login.salesforce.com
```
ou

    - F1 ou Ctrl + Shift + P e digite SFDX: Authorize an Org
    - selecione a opção Production (login.salesforce.com)

4. Após isso, faça o deploy do projeto na sua Org.
```sh
sfdx force:source:deploy -p ./force-app/main/default -u my-sandbox --wait=90

```

