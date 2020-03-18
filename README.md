
# Automação do ZERO

## Turma 1808 de Agosto

### Passos para o desafio:

* git clone git@github.com:ninjahouse/azero-1808.git
* git checkout -b "seu_nome_aula_x"
* implementar o desafio
* git add .
* git commit -m "comentario da alteração"
* git push origin seu_nome_aula_x


## Executando com relatório:

* cucumber -t @smoke --format html --out=log/reports.html


# Desafio Campos obrigatórios

    # Não usar Esquema do Cenário
    # é obrigatório? não

    # Se o usuario não selecionar a marca,
    # deve exibir a mensagem "Selecione a marca do seu carro."

    # Se o usuario não selecionar o modelo,
    # deve exibir a mensagem "Selecione o modelo do seu carro."

    # Se o usuario não selecionar a versão,
    # deve exibir a mensagem "Selecione a versão do seu carro."

    # Se o usuario não selecionar o ano,
    # deve exibir a mensagem "Selecione o ano do seu carro."

    # Se o usuario não informar o preco,
    # deve exibir a mensagem "Informe o preço do seu carro."