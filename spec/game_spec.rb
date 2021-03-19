require 'game'

describe Game do
  # let(:player2) { instance_double("Player", name: "Peachy Bop") }

  let(:game) { Game.new("Poofy Peanut", "Magic Bella") }


  describe "#attack" do
    it 'reduces the hitpoints by 10 hitpoints' do
      # allow(player2).to receive(:reduce)
    expect { game.attack(game.player2) }.to change { game.player2.hitpoints }.by(-10)
    end
  end
end
