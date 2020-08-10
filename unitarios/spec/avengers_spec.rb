
class AvengersHeadQuarters
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

describe AvengersHeadQuarters do
  it "deve adicionar um vingador" do
    hq = AvengersHeadQuarters.new

    hq.put("Spiderman")
    expect(hq.list).to eql ["Spiderman"]
  end

  it "deve adicionar uma lista de vingadores" do
    hq = AvengersHeadQuarters.new

    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")

    res = hq.list.size > 0

    expect(res).to be true
    expect(hq.list).to include "Thor"
  end

  it "thor deve ser o primeiro da lista" do
    hq = AvengersHeadQuarters.new

    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")

    expect(hq.list).to start_with("Thor")
  end

  it "Ironman deve ser o último da lista" do
    hq = AvengersHeadQuarters.new

    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")
    hq.put("Ironman")

    expect(hq.list).to end_with("Ironman")
  end

  it "deve conter o sobrenome" do
    avenger = "Peter Parker"

    expect(avenger).to match(/Parker/)
    expect(avenger).not_to match(/Luppi/)
  end
end
