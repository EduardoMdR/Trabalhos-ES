# Eduardo Marques dos reis - 190012358
class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

arquivoComLixo = open("engsoft.txt", "r") { |io|
  io.read.encode("UTF-8", invalid: :replace, replace: "")
}

lista = arquivoComLixo.gsub(/[^A-ZÃÉÍÓÕÇa-z0-9\/]/, ' ')
lista = lista.split

verbose = 0
matricula, nome = 0
lista_completa = {}

lista.each do |value|
  if value.chars.first.is_i?
    if value.length == 10
      verbose = 1
    else
      verbose = 0
    end
  end
  if value == "Registro" || value == "lstmatraa" || value == "16/08/2019"
    verbose = 0
  end
  if verbose == 1
    if value.chars.first.is_i?
      matricula = value
    else
      if lista_completa[matricula]
        lista_completa[matricula].push(value)
      else
        lista_completa[matricula] = [value]
      end
    end
  end
end

def ordenacao(lista, verbose=0)
  include Enumerable

  if verbose == 1
    lista = lista.sort
  end

  lista.each do |key, value|
    yield "#{key}   #{value.join(' ')}"
  end
end

menu = 1
while menu == 1 || menu == 2
  puts "\n1. Ordernar por matricula"
  puts "2. Ordernar por nome"
  puts "Qualque outro. Sair"
  menu = gets.to_i
  case menu
    when 1
      ordenacao(lista_completa, 1) {|y| print "\n #{y}"}
    when 2
      ordenacao(lista_completa) {|y| print "\n #{y}"}
  end
end