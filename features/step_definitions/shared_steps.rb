# login.feature - cadastro.feature
Então('sou autenticado com sucesso') do
  sleep 5
  expect(page).to have_text("Marcos")

end
