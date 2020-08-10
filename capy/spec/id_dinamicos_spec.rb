

describe "IDs Dinâmicos", :dinamico do
  before(:each) do
    visit "/"

    click_link "Login com Cadastro"
  end

  it "cadastro" do
    find("input[id*=UsernameInput]").set("Thiago")
    find("input[id*=PasswordInput]").set("Luppi")
    find("a[id*=GetStartedButton]").click

    expect(find("#result")).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
