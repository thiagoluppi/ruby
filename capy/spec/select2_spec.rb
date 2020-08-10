

describe "Select2", :select2 do
  #
  describe "Single", :single do
    before(:each) do
      visit "/"
      click_link "Select2 - Uma opção"
    end

    it "seleciona ator por nome" do
      find(".select2-selection--single").click
      sleep 2
      find(".select2-results__option", text: "Adam Sandler").click
      sleep 2
    end

    it "busca e clica no ator", :clica do
      find(".select2-selection--single").click
      sleep 2
      find(".select2-search__field").set("Chris Rock")
      find(".select2-results__option").click
      sleep 3
    end
  end

  describe "Multiplo", :multiplo do
    before(:each) do
      visit "/"
      click_link "Select2 - Multiplas opções"
    end

    # Classes
    def selecione_digit(ator)
      find(".select2-selection--multiple").click
      find(".select2-search__field").set(ator)
      find(".select2-results__option").click
    end

    def selecione_clicando(ator)
      find(".select2-selection--multiple").click
      find(".select2-results__option", text: ator).click
    end

    def remover(ator)
      span = find(".select2-selection--multiple")
      choice = span.find(".select2-selection__choice", text: ator)
      choice.find(".select2-selection__choice__remove").click
    end

    ##################################

    it "seleciona atores digitando" do
      atores = ["Jim Carrey", "Chris Rock", "Owen Wilson"]

      atores.each do |a|
        selecione_digit(a)
      end

      sleep 1
    end

    it "seleciona atores clicando", :clicando do
      selecione_clicando("Adam Sandler")
      selecione_clicando("Owen Wilson")
    end

    it "removendo atores selecionados", :remove do
      selecione_clicando("Adam Sandler")
      selecione_clicando("Jim Carrey")
      selecione_clicando("Owen Wilson")
      sleep 1

      remover("Adam Sandler")
      sleep 1
      remover("Owen Wilson")

      sleep 1
    end
  end
end
