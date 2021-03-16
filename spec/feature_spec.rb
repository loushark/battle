describe Battle do
  describe 'the homepage', type: :feature do
    it 'returns a string content from the homepage' do
      visit '/'
      expect(page).to have_content('Testing infrastructure working')
    end
  end
end
