describe Battle do
  describe 'the homepage', type: :feature do
    it 'returns a string content from the homepage' do
      visit '/'
      expect(page).to have_content('Testing infrastructure working')
    end
  end

  describe 'the homepage', type: :feature do
    it 'players can see their names on the screen when submitting form' do
      visit '/battle'
      fill_in 'name1', with: "Snuggly Marshmallow"
      fill_in 'name2', with: "Captain Potato"
      click_button 'Submit'
      expect(page).to have_content "Snuggly Marshmallow" "Captain Potato"
    end
  end
end
