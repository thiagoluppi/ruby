

describe "Caixa de opções", :dropdown do
  it "item específico simples" do
    visit "/"

    click_link "Dropdown"

    select("Loki", from: "dropdown")
  end

  it "item específico com o find" do
    visit "/"

    click_link "Dropdown"

    drop = find(".avenger-list")
    drop.find("option", text: "Scott Lang").select_option
    sleep 3
  end

  it "qualquer item", :amostra do
    visit "/"

    click_link "Dropdown"

    drop = find(".avenger-list")
    drop.all("option").sample.select_option
  end
end
