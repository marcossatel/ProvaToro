Dado('que eu acessei a página de login') do
  # cenario
  @home.acessar
  @nav.vai_para_login
end

Quando('faço login com:') do |table|
  @usuario = table.rows_hash
  @login.faz_login(@usuario[:email], @usuario[:senha])
end

Então('devo ver a seguinte mensagem de {string}') do |mensagem_alerta|
  expect(@login.msg_alerta).to eql mensagem_alerta
end
