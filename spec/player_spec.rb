require 'player'

describe Player do
  let(:player) { Player.new("James") }

  it "has a name attribute" do
    expect(player.name).to be_a(String)
  end
end
