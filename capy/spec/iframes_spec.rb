

describe "iFrames" do
  describe "iFrame bom", :bom do
    before(:each) do
      visit "/"

      click_link "iFrame Bom"
    end

    it "adicionar ao carrinho" do
      within_frame("burgerId") do
        produto = find(".menu-item-info-box", text: "REFRIGERANTE")
        produto.find("a").click

        expect(find("#cart")).to have_content "R$ 4,50"
      end
    end
  end

  describe "iFrame ruim", :ruim do
    before(:each) do
      visit "/"

      click_link "iFrame Ruim"
    end

    it "carrinho deve estar vazio" do
      script = '$(".box-iframe").attr("id", "tempId");'
      page.execute_script(script)

      within_frame("tempId") do
        expect(find("#cart")).to have_content "Seu carrinho está vazio!"
      end
    end
  end
end
