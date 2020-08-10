

describe "Mouse hover", :hovers do
  before(:each) do
    visit "/"
    click_link "Hovers"
  end

  it "quando passo o mouse sobre Blade", :blade do
    card = find("img[alt=Blade]")
    card.hover

    expect(page).to have_content "Nome: Blade"
  end

  it "quando o mouse sobre Pantera Negra", :pantera do
    card = find("img[alt='Pantera Negra']")
    card.hover

    expect(page).to have_content "Nome: Pantera Negra"
  end

  it "quando o mouse sobre Homem Aranha", :aranha do
    card = find("img[alt='Homem Aranha']")
    card.hover

    expect(page).to have_content "Nome: Homem Aranha"
  end

  after(:each) do
    sleep 0.5
  end
end
