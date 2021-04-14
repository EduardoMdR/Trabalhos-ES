class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

arquivoComLixo = open("engsoft.txt", "r") { |io|
  io.read.encode("UTF-8", invalid: :replace, replace: "")
}

ola = arquivoComLixo.gsub(/[:alpha:]ÃÉÍÓÕÇ/, ' ')
ola = ola.split
# puts "#{ola}"
verbose = 0
ola.each do |value|
  if value.chars.first.is_i?
    if value.length == 10
      verbose = 1
    else
      verbose = 0
    end
  end
  if value == "Registro" || value == "lstmatraa" || value == "16/08/2019" || value.chars.first == "-"
    verbose = 0
  end
  if verbose == 1
    if value.chars.first.is_i?
      print "\n#{value}   "
    else
      print "#{value} "
    end
  end
end