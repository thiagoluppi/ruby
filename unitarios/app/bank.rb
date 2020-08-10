
class Conta
  attr_accessor :saldo, :mensagem

  def initialize(saldo)
    self.saldo = saldo
  end

  def saca(valor, saque_max, taxa)
    if (self.saldo < valor)
      self.mensagem = "Saldo insuficiente para saque"
    elsif (valor > saque_max)
      self.mensagem = "Limite máximo por saque é de R$ #{saque_max}"
    else
      self.saldo -= valor + taxa
    end
  end
end

class ContaCorrente < Conta
  def saca(valor, saque_max = 700, taxa = 5.00)
    super
  end
end

class ContaPoupanca < Conta
  def saca(valor, saque_max = 500, taxa = 2.00)
    super
  end
end
