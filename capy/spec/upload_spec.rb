

describe "Upload", :upload do
  before(:each) do
    @texto = Dir.pwd + "/spec/fixtures/texto.txt"
    @galaxy = Dir.pwd + "/spec/fixtures/galaxy.jpg"

    visit "/"
    click_link "Upload de arquivos"
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @texto)
    click_button "Upload"

    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "texto.txt"
  end

  it "upload arquivo de imagem", :upload_imagem do
    attach_file("file-upload", @galaxy)
    click_button "Upload"

    div_galaxy = find("#new-image")

    expect(div_galaxy[:src]).to include "/uploads/galaxy.jpg"
  end

  after(:each) do
    sleep 3
  end
end
