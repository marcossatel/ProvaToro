Dado('que acessei o formulário e anúncio de veículos') do
  @nav.vai_para_anuncio
end

Dado('que possuo o seguinte veículo:') do |table|
  @anuncios = table.hashes
  DAO.new.remover_anuncio(@anuncios.first)
end

# desativado porque queremos duplicar via banco de dados
Dado('eu já cadastrei este anúncio anteriormente') do
  @veiculo = @anuncios.first
  @anuncio_page.novo(@veiculo, @blindado)
  @swal.ok
  @nav.vai_para_anuncio
end

Dado('este anúncio já está cadastrado') do
  DAO.new.inserir_anuncio(@anuncios.first, @usuario[:email])
end

Dado('este veículo é blindado') do
  @blindado = true
end

Quando('faço o anúncio deste veículo') do
  @veiculo = @anuncios.first
  @anuncio_page.novo(@veiculo, @blindado)
end

Então('devo ver a seguinte mensagem:') do |msg_sucesso|
  expect(@swal.mensagem.text).to eql msg_sucesso
end

Então('devo ter somente {int} anúncio cadastrado com estas características') do |quantidade|
  # verificação no banco
  # res = DAO.new.buscar_anuncio(@veiculo)
  # expect(res.count).to eql quantidade

  # verificação na tela
  @meus_anuncios_page.acessar
  @meus_anuncios_page.buscar(@veiculo)
  expect(
    @meus_anuncios_page.retorna_registros.size
  ).to eql quantidade
end
