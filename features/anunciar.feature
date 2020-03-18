#language: pt

Funcionalidade: Anunciar meu carro
    Para que eu possa receber ofertas de compras
    Sendo um usuário cadastrado
    Posso anunciar meu veículo

    Contexto: Formulário de anúncio
        Dado que acessei o formulário e anúncio de veículos

    @login @smoke
    Cenario: Criar anúncio

        E que possuo o seguinte veículo:
            | marca     | modelo | versao    | ano  | preco      |
            | Chevrolet | Camaro | Blue 79   | 1979 | 250.000,00 |
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Parabéns. Seu carro foi anunciado com sucesso.
            """
        E devo ter somente 1 anúncio cadastrado com estas características
    
    @login @logout
    Cenario: Carro blindado
        
        E que possuo o seguinte veículo:
            | marca | modelo | versao | ano  | preco     |
            | Honda | Fit    | CVT    | 2012 | 30.000,00 |
        E este veículo é blindado
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Não anúnciamos carro blindado.
            """
        E devo ter somente 0 anúncio cadastrado com estas características
    
    @login @logout @temp
    Cenario: Anuncio duplicado
        Ao preencher o formulário quando já existe um anuncio cadastrado
        com a mesma marca, modelo e versão, o sistema não deve inserir
        o cadastro.

        E que possuo o seguinte veículo:
            | marca | modelo | versao         | ano  | preco     |
            | Ford  | Fusion | 2.4 automático | 2016 | 70.000,00 |
        Mas este anúncio já está cadastrado
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Este anúncio já foi cadastrado.
            """
        E devo ter somente 1 anúncio cadastrado com estas características
    
