# MongoDB

require 'mongo'

class DAO
  Mongo::Logger.logger = Logger.new('log/mongo.log')

  def remover_usuario(email)
    usuarios.delete_one('profile.email' => email)
  end

  def inserir_anuncio(veiculo, email_do_dono)
    u = usuarios.find('profile.email' => email_do_dono).first

    anuncios.insert_one(
      'brand' => veiculo[:marca],
      'model' => veiculo[:modelo],
      'desc' => veiculo[:versao],
      'year' => veiculo[:ano],
      'price' => veiculo[:preco],
      'owner' => u[:_id]
    )
  end

  def remover_anuncio(veiculo)
    anuncios.delete_many(
      'brand' => veiculo[:marca],
      'model' => veiculo[:modelo],
      'desc' => veiculo[:versao]
    )
  end

  def buscar_anuncio(veiculo)
    anuncios.find(
      'brand' => veiculo[:marca],
      'model' => veiculo[:modelo],
      'desc' => veiculo[:versao]
    )
  end

  private

  def usuarios
    client[:users]
  end

  def anuncios
    client[:sells]
  end

  def client
    str_conn = 'mongodb://aluno:qaninja@ds117719.mlab.com:17719/ninjamotors'
    Mongo::Client.new(str_conn)
  end
end
