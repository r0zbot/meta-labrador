# meta-labrador

Para compilação usando docker, clone o repositório do labrador-linux na subpasta data/ (`mkdir data && cd data && git clone https://github.com/r0zbot/labrador-linux.git`) e execute o script `./build.sh`. Isso compilará o kernel por completo (com output na pasta output) usando docker e é necessário para a execução dos comandos abaixo.

Para recompilar somente o módulo do driver de ethernet, execute `./build.sh ethernet`. O arquivo de saida ficará em `linux/drivers/net/ethernet/caninos/labrador_eth.ko`.

Para recompilar somente o device tree da placa, execute `./build.sh dts`. O arquivo final ficará na pasta `output`.

Para recompilar somente o driver do PHY da realtek, execute `./build.sh realtek`. O arquivo final ficará em `linux/drivers/net/phy/realtek.ko`.

## Deploy local 

É possível usar o script `./build_and_run.sh` com os mesmos comandos acima para automaticamente compilar e instalar os arquivos na placa, dado que ela esteja conectada na rede e configurada no seu `ssh_config` como `labrador`. Para evitar ter que digitar a senha várias vezes, é recomendado adicionar sua chave ssh tanto no usuário `caninos` quanto no `root` da placa.

Exemplo:

```
Host labrador
    HostName 192.168.192.210
    User root
```
