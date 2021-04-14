# def palindromo(string)
#   if string != ""
#     string == string.reverse
#     puts "#{string}"
#     puts "#{string.reverse}"
#   end
# end
# palindromo(ola)

# Questão A
class String
  def palindromo?
    self == self.reverse
  end
end

ola = "Tenet"
puts "#{ola.downcase.palindromo?}"

# Questão B
def count_words(string)
  hash = Hash.new(0)
  string.downcase!
  string.split.each do |form|
    hash[form] += 1
    # hash na posição |string| recebe +1
  end
  hash
end
puts "#{count_words "Um homem, um plano, um canal - Panamá"}"
puts "#{count_words "Doo bee doo bee doo"}"

# https://github.com/MonicaVani/RUBY-CALISTHENICS