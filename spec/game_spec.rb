require 'game'

describe Game do
  # let(:player2) { instance_double("Player", name: "Peachy Bop") }
  let(:game) { Game.new("Poofy Peanut", "Magic Bella") }
  let(:player3) { double :player3 }

  describe "#attack" do
    it 'reduces the hitpoints by 10 hitpoints' do
      # allow(player2).to receive(:reduce)
    expect { game.attack(game.player2) }.to change { game.player2.hitpoints }.by(-10)
    end
  end

  describe "#switch_turns" do
    it 'switches the attacking player' do
      expect { game.switch_turns }.to change { game.current_player.name }.to ("Magic Bella")
    end
  end

  describe "#hitpoints_zero?" do
    it "returns true if HP is at zero" do
    allow(player3).to receive(:hitpoints) {10}
    expect(game.hitpoints_zero?(player3)).to eq(true)
    end
  end
end
