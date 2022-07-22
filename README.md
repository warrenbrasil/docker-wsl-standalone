# docker-wsl-standalone

Neste repositório armazenamos scripts para facilitar a configuração do docker em nossos ambientes.

Essa iniciativa parte como alternativa ao docker desktop que passou a ser pago.

# Utilizar docker no WSL do Windows

## Instalando o WSL Ubuntu

Para realizar a instalação do WSL no Windows, é sugerido seguir os passos da [documentação da própria Microsoft](https://docs.microsoft.com/pt-br/windows/wsl/install). Lembrando que para utilizar o docker é necessário estar com o [WSL na versão 2](https://docs.microsoft.com/pt-br/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2).

Após a configuração do WSL, pode-se instalar o Ubuntu:

`wsl --install -d Ubuntu`


## Instalando o docker

Depois de instalar e configurar o Ubuntu, é possível instalar o docker utilizando o [script para o setup](https://github.com/warrenbrasil/docker-wsl-standalone/tree/main/scripts/ubuntu20.04-docker-setup.sh). 

Estando no WSL e na raiz deste repositório, basta rodar:

`./scripts/ubuntu20.04-docker-setup.sh`

Se o script executar sem erros, o docker já está instalado e pronto para o uso.

É recomendado sair do WSL e entrar novamente para que as permissões sejam devidamente aplicadas.

## Utilizando o docker

O docker será utilizado a partir do WSL.

Toda vez que entrar no WSL e for usar o docker é necessário verificar se o serviço está rodando. Para isso:

`sudo service docker status`

Se o retorno for “docker is not running” é necessário iniciar o serviço com o comando:

`sudo service docker start`
