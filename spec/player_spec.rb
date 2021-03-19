require 'player'

describe Player do
  let(:player) { Player.new("Crazy Teaspoon") }

  it 'initializes a name on a new player instance' do
    expect(player.name).to eq("Crazy Teaspoon")
  end

  it 'initializes a deafult hitpoint value on a new player instance' do
    expect(player.hitpoints).to eq(60)
  end

  describe "#attack" do
    it 'reduces the hitpoints by 10 hitpoints' do
    expect { player.attack }.to change { player.hitpoints }.by(-10)
    end
  end
end
