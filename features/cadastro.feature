#language: pt

Funcionalidade: Cadastro do usuário
    Sendo um visitante do site
    Posso fazer meu cadastro com nome, email e senha
    Para que eu possa anunciar meu veiculo usado

@sprint1 @smoke @logout
Cenário: Cadastro simples

	E que estou na página de cadastro
	Quando faço o meu cadastro com
		| nome  | Marcos_MoT_1     |
		| email | marcos_MoT_1@teste.com.br |
		| senha | 12345678              |
	Então sou autenticado com sucesso






















Esquema do Cenário: Tentativa de cadastro

	Dado que estou na página de cadastro
	Quando faço o meu cadastro com
		| nome  | <nome>  |
		| email | <email> |
		| senha | <senha> |
	Então devo ver a mensagem "<alerta>"

    Exemplos: 
      | nome   | email        | senha  | alerta                                  |
      | marcos | eu#teste.io  | 123456 | Email inválido.                         |
      | marcos | eu@teste.net |        | Senha não informada.                    |
      |        | eu@teste.com | 123456 | Nome não informado.                     |
      | marcos | eu@teste.com | 12345  | Senha deve ter pelo menos 6 caracteres. |
