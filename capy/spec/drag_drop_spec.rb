
describe "Drag and Drop", :drop do
  before(:each) do
    visit "/"
    click_link "Drag and Drop"
  end

  it "Homem Aranha pertence ao time do Stark" do
    stark = find(".team-stark .column")
    cap = find(".team-cap .column")

    spiderman = find("img[alt$=Aranha]")
    spiderman.drag_to stark

    expect(stark).to have_css "img[alt$=Aranha]"
    expect(cap).not_to have_css "img[alt$=Aranha]"
  end

  it "ping pong de aranha", :mover do
    stark = find(".team-stark .column")
    cap = find(".team-cap .column")

    spiderman = find("img[alt$=Aranha]")

    10.times do
      sleep 0.2
      spiderman.drag_to stark
      sleep 0.2
      spiderman.drag_to cap
    end
  end

  after(:each) do
    sleep 2
  end
end
