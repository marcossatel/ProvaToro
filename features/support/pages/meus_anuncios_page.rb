class MeusAnunciosPage
  include Capybara::DSL

  def acessar
    visit '/meus-anuncios'
  end

  def buscar(veiculo)
    seleciona_marca(veiculo[:marca])
    escolhe_modelo(veiculo[:modelo])
    find('#descriptionFilter').set veiculo[:versao]
    click_button 'Buscar'
  end

  def retorna_registros
    all('table tbody tr')
  end

  private

  def seleciona_marca(marca)
    find('#brandFilter').find('option', text: marca).select_option
  end

  def escolhe_modelo(modelo)
    find('#modelFilter').find('option', text: modelo).select_option
  end
end
