describe Battle do
  describe 'the homepage', type: :feature do
    it 'returns a string content from the homepage' do
      visit '/'
      expect(page).to have_content('Testing infrastructure working')
    end
  end

  describe 'the homepage', type: :feature do
    it 'players can see their names on the screen when submitting form' do
      sign_in_and_play
      expect(page).to have_content "Snuggly Marshmallow" "Captain Potato"
    end
  end

  describe 'the homepage', type: :feature do
    it "lets player 1 see player 2s hit points" do
      sign_in_and_play
      expect(page).to have_content "Captain Potato: 10HP"
    end
  end
end
