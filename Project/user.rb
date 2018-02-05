require 'json' 
# Importa a biblioteca para trabalhar com JSON


class User 

  # libera na classe User, 'getters', 'setters'
  # e outras funções basicas para essas variáveis
  attr_accessor :name, :email, :permission  
    
  # Para instanciar a classe
  # *args -> recebe todas as variáveis passadas como argumento,
  # e as concatena em um vetor
  def initialize (*args)
    @name = args[0]
    @email = args[1]
    @permission = User.permissions_from_template
  end
  
  # carrega os permissoes do arquivo base
  def self.permissions_from_template
    # self. -> faz com que a função só possa ser chamada pela classe
    
    # Leitor de arquivo (hardCoding)
    # Caso fosse passado pelo usuário usaria se ARGS
    file = File.read 'user_permissions_template.json'
    
    # Cria um JSON object
    JSON.load(file, nil, symbolize_names: true)
  end
  
  # Salva o tudo que foi passado no initialize em um arquivo json
  def save
    self_json = {name: @name, email: @email, permission: @permission}.to_json
    
    # Abre um arquivo, 'a' -> append
    open('users.json', 'a') do |file|
      file.puts self_json
    end
    
  end
  
  
end