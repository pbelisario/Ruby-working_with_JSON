require 'pp'
# Deixa a saida um pouco mais bonita

require_relative 'user'
# Pede para utilizar a classe user
# que está na mesma pasta

user = User.new 'nome', 'nome@example.com'

#output the object
pp user

# Salva os dados do user em um arquivo JSON
user.save