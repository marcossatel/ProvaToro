Dado('que estou na página de cadastro') do
  @cadastro_page.visita
end

Quando('faço o meu cadastro com') do |table|
  @usuario = table.rows_hash
  @cadastro_page.novo(@usuario)
end

Então('devo ver a mensagem {string}') do |mensagem_alerta|
  expect(@cadastro_page.alerta).to have_content mensagem_alerta
end


 # # Data Access Object
  # DAO.new.remover_usuario(@usuario[:email])