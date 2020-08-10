

describe "Login com cadastro", :login3 do
  before(:each) do
    visit "/"

    click_link "Login com Cadastro"
  end
  it "login com sucesso", :login_sucesso do
    login_form = find("form[name=login]")

    login_form.find("input[name=username]").set("stark")
    login_form.find("input[name=password]").set("jarvis!")

    click_button("Entrar")
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "login com within", :login_within do
    within("form[name=login]") do
      find("input[name=username]").set("stark")
      find("input[name=password]").set("jarvis!")
    end

    click_button("Entrar")
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "cadastro com sucesso", :cadastro_sucesso do
    cadastro_form = find("form[name=signup]")

    cadastro_form.find("input[name=username]").set("Thiago")
    cadastro_form.find("input[name=password]").set("Luppi")

    click_link("Criar Conta")
    expect(find("#result")).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end

  it "cadastro com within", :cadastro_within do
    within("form[name=signup]") do
      find("input[name=username]").set("Thiago")
      find("input[name=password]").set("Luppi")
    end

    click_link("Criar Conta")
    expect(find("#result")).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
