class LoginPage
  include Capybara::DSL

  def faz_login(email, senha)
    sleep 5
    find('input[id=username]').set email
    find('input[type=password]').set senha
    click_button 'Entrar'
    
    
  end

  def msg_alerta
    within('modal-panel-content') do
      return find('form-error-message').text
    end
  end
end
