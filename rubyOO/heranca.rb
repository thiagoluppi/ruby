
class Veiculo
  attr_accessor :nome, :marca, :modelo

  def initialize(nome, marca, modelo)
    self.nome = nome
    self.marca = marca
    self.modelo = modelo
  end

  def ligar
    puts "O veiculo #{self.nome} foi ligado"
  end

  def buzinar
    puts "O veiculo #{self.nome} acabou de buzinar, Beep! Beep!"
  end
end

class Carro < Veiculo
  def dirigir
    puts "O carro #{self.nome} está iniciando o trajeto"
  end
end

class Moto < Veiculo
  def pilotar
    puts "A moto #{self.nome} está iniciando o trajeto"
  end
end

carro = Carro.new("Uno", "Fiat", "Mile")

puts carro.nome
puts carro.marca
puts carro.modelo

puts carro.ligar
puts carro.buzinar
puts carro.dirigir

carro_2 = Carro.new("Escort", "Ford", "EX")

puts carro_2.nome
puts carro_2.marca
puts carro_2.modelo

puts carro_2.ligar
puts carro_2.buzinar
puts carro_2.dirigir

moto = Moto.new("Ténéré", "Yamaha", "Adventure")

puts moto.nome
puts moto.marca
puts moto.modelo

puts moto.ligar
puts moto.buzinar
puts moto.pilotar
