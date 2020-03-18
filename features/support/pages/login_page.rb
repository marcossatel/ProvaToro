class LoginPage
  include Capybara::DSL

  def faz_login(email, senha)
    find('input[placeholder=Email]').set email
    find('input[type=password]').set senha
    click_button 'Entrar'
  end

  def msg_alerta
    within('form[id=login]') do
      return find('.alert').text
    end
  end
end
