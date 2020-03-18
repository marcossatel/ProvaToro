class Nav
  include Capybara::DSL

  def vai_para_login
    click_link 'Acessar'
  end

  def menu_usuario
    within('.navbar') do
      return find('#userMenu')
    end
  end

  def vai_para_anuncio
    click_link 'Vender meu Carro'
  end

  def sair
    menu_usuario.click
    click_link 'Sair'
  end
end

class SweetAlert
  include Capybara::DSL

  def mensagem
    find('#swal2-content')
  end

  def ok
    click_button 'OK'
  end
end
