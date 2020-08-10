

# begin
#   # Devo tentar alguma coisa
#   arquivo = File.open("./ola")
#   if arquivo
#     puts arquivo.read
#   end
# rescue Exception => e
#   # Obter possível erro
#   puts e.message
#   puts e.backtrace
# end

def soma(n1, n2)
  n1 + n2
rescue Exception => e
  puts e.message
end

soma("10", 5)
