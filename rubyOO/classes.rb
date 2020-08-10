

class Conta
  attr_accessor :saldo, :nome

  def initialize(nome)
    self.saldo = 0.0
    self.nome = nome
  end

  def deposita(valor)
    self.saldo += valor
    puts "Depositando a quantia de #{valor} reais na conta de #{self.nome}"
  end
end

conta = Conta.new("Thiago")

conta.deposita(100.00)
puts "Saldo de #{conta.nome} agora é de #{conta.saldo}"

conta.deposita(10.00)
puts "Saldo de #{conta.nome} agora é de #{conta.saldo}"
