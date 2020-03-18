#language: pt

Funcionalidade: Login
    Para eu possa anunciar meus veículos
    Sendo um usuário cadastrado
    Posso acessar o sistema com meu email e senha

    Contexto: Form de login
        Dado que eu acessei a página de login

    @smoke @logout
    Cenario: Login do usuário

        Quando faço login com:
            | nome  | marcos                |
            | email | marcos.sate@gmail.com |
            | senha | 12345678              |
        Então sou autenticado com sucesso

    @tentativa_login
    Esquema do Cenario: Tentar logar

        Quando faço login com:
            | email | <email> |
            | senha | <senha> |
        Então devo ver a seguinte mensagem de "<alerta>"

        Exemplos: 
        | email                     | senha  | alerta                        |
        | padre.kevedo@nokziste.org | 123456 | Usuário e/ou senha inválidos. |
        | eu@papito.io              | xyz123 | Usuário e/ou senha inválidos. |
        | eu@papito.com             |        | Senha não informada.          |
        |                           | 123456 | Email não informado.          |
        | teste#teste.com           | 123456 | Email inválido.               |
