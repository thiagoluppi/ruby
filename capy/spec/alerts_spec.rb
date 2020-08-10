

describe "Alertas de JS", :alerts do
  before(:each) do
    visit "/"
    click_link "Alertas em JavaScript"
  end

  it "alerta", :alerta do
    click_button "Alerta"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "Isto é uma mensagem de alerta"
  end

  it "sim confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content "Mensagem confirmada"
  end

  it "não confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.dismiss

    expect(page).to have_content "Mensagem não confirmada"
  end

  it "aceita prompt", :accept_prompt do
    accept_prompt(with: "Thiago") do
      click_button "Prompt"
      sleep 2
    end

    expect(page).to have_content "Olá, Thiago"
    sleep 3
  end

  it "não aceita prompt", :dismiss_prompt do
    dismiss_prompt(with: "") do
      click_button "Prompt"
      sleep 3
    end

    expect(page).to have_content "Olá, null"
  end
end
