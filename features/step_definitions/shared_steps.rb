# login.feature - cadastro.feature
Então('sou autenticado com sucesso') do
  expect(@nav.menu_usuario.text).to eql @usuario[:nome]
end
