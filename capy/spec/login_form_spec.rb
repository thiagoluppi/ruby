

describe "Forms", :forms, :smoke do
  it "login com sucesso" do
    visit "/"

    click_link "Login"

    fill_in "userId", with: "stark"
    fill_in "password", with: "jarvis!"

    click_button "Login"

    visivel = find("#flash").visible?
    expect(visivel).to be true

    area_logada_texto = find("#flash").text
    expect(area_logada_texto).to include "Olá, Tony Stark. Você acessou a área logada!"

    elemento = find("#flash")
    expect(elemento).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "senha incorreta" do
    visit "/"
    click_link "Login"

    fill_in "userId", with: "thiago"
    fill_in "passId", with: "jarvis!"

    click_button "Login"

    area_logada_texto = find("#flash").text
    expect(area_logada_texto).to include "O usuário informado não está cadastrado!"

    elemento = find("#flash")
    expect(elemento).to have_content "O usuário informado não está cadastrado!"
  end

  it "usuario nao cadastrado" do
    visit "/"
    click_link "Login"

    fill_in "userId", with: "stark"
    fill_in "passId", with: "senha"

    click_button "Login"

    area_logada_texto = find("#flash").text
    expect(area_logada_texto).to include "Senha é invalida!"

    elemento = find("#flash")
    expect(elemento).to have_content "Senha é invalida!"
  end

  it "cenario que falha", :falha do
    visit "/"

    click_link "Login"

    fill_in "userId", with: "stark"
    fill_in "password", with: "jarvis!"

    click_button "Login"

    visivel = find("#flash").visible?
    expect(visivel).to be true

    area_logada_texto = find("#flash").text
    expect(area_logada_texto).to include "Esse texto não existe"

    elemento = find("#flash")
    expect(elemento).to have_content "Esse texto não existe"
  end
end
