

describe "Tabelas", :tabs, :smoke do
  before(:each) do
    visit "/"

    click_link "Tabelas"
  end

  it "deve exibir o salario de Stark" do
    atores = all("table tbody tr")

    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }

    expect(stark.text).to include "10.000.000"
  end

  it "deve exibir o salario de Vin Diesel" do
    diesel = find("table tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "10.000.000"
  end

  it "deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")

    movie = diesel.all("td")[2].text

    expect(movie).to eql "Velozes e Furiosos"
  end

  it "deve exibir o instagram do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text

    expect(insta).to eql "@teamcevans"
  end

  it "deve selecionar Chris Prat para remocao", :chris do
    prat = find("table tbody tr", text: "Chris Pratt")
    prat.find("a", text: "delete").click
    msg = page.driver.browser.switch_to.alert.text

    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "deve selecionar Chris Prat para edicao", :chris do
    prat = find("table tbody tr", text: "Chris Pratt")
    prat.find("a", text: "edit").click
    msg = page.driver.browser.switch_to.alert.text

    expect(msg).to eql "Chris Pratt foi selecionado para edição!"
  end
end
