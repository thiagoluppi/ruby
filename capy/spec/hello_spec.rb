
describe "Meu primeiro script", :hello, :smoke do
  it "acessar a página" do
    visit "/"
    expect(page.title).to eql "Training Wheels Protocol"
  end
end
