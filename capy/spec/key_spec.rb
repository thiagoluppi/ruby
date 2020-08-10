

describe "Teclado", :key do
  before(:each) do
    visit "/"
    click_link "Botões do Teclado"
  end

  it "enviando teclas" do
    teclas = %i[tab escape space enter shift control alt]

    teclas.each do |tecla|
      find("#campo-id").send_keys(tecla)
      expect(page).to have_content "You entered: #{tecla.upcase}"
    end
  end

  it "enviado letras" do
    letras = %w[a s d f g h k l]

    letras.each do |letra|
      find("#campo-id").send_keys(letra)
      expect(page).to have_content "You entered: #{letra.upcase}"
      sleep 1
    end
  end
end
