# docker-wsl-standalone

Neste repositório armazenamos scripts para facilitar a configuração do docker em nossos ambientes.

Essa iniciativa parte como alternativa ao docker desktop que passou a ser pago.

# Utilizar docker no WSL do Windows

## Instalando o WSL Ubuntu

Para instalr o WSL no Windows, é sugerido seguir os passos da [documentação da própria Microsoft](https://docs.microsoft.com/pt-br/windows/wsl/install). 

**Para utilizar o docker é necessário estar com o [WSL na versão 2](https://docs.microsoft.com/pt-br/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2).**

Listando todas as distribuições instaladas e suas versões de WSL:

`wsl -l --all -v`

    Se a versão instalada de ubuntu estiver como:
    NAME      STATE           VERSION
    Ubuntu    Running         1

    Pode-se alterar a versão com o comando:
    wsl --set-version ubuntu 2

Utilizando a versão 2 do WSL como padrão para novas instalações:

`wsl --set-default-version 2`

Instalando a última versão do Ubuntu compatível com WSL:

`wsl --install -d ubuntu`

Caso seja necessário desinstalar:

`wsl --unregister -d ubuntu`

## Instalando o docker

Depois de instalar e configurar o Ubuntu, é possível instalar o docker utilizando o [script para o setup](https://github.com/warrenbrasil/docker-wsl-standalone/tree/main/scripts/ubuntu20.04-docker-setup.sh). 

Estando no WSL e na raiz deste repositório, basta rodar:

`./scripts/ubuntu20.04-docker-setup.sh`

Se o script executar sem erros, o docker já está instalado e pronto para o uso.

É preciso reiniciar o terminal para utilizar o docker sem sudo.

## Utilizando o docker

O docker será utilizado a partir do WSL.

Toda vez que entrar no WSL e for usar o docker é necessário verificar se o serviço está rodando. Para isso:

`sudo service docker status`

Se o retorno for “docker is not running” pode-se iniciar o serviço com o comando:

`sudo service docker start`
