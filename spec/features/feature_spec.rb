describe Battle do
  describe 'the homepage', type: :feature do
    it 'returns a string content from the homepage' do
      visit '/'
      expect(page).to have_content('Testing infrastructure working')
    end

    it 'players can see their names on the screen when submitting form' do
      sign_in_and_play
      expect(page).to have_content "PLAYER 1: Snuggly Marshmallow\nPLAYER 2: Captain Potato"
    end

    it "lets player 1 see player 2s hit points" do
      sign_in_and_play
      expect(page).to have_content "Captain Potato has 60HP"
    end

    it "lets player 1 attack player 2 and receive a confirmation" do
      sign_in_and_play

      click_button 'Attack'
      expect(page).to have_content "Snuggly Marshmallow attacked Captain Potato!"
    end
  end

  feature 'reducing a players HP' do
    scenario 'player 2s HP reduces by 10 when attacked by player 1' do
      sign_in_and_play
      visit '/play'
      click_button 'attack'
      click_button 'OK'
      expect(page).not_to have_content 'Captain Potato has 60HP'
      expect(page).to have_content 'Captain Potato has 50HP'
    end
  end

  feature 'switch turns' do
    scenario 'switch which player is attacking' do
      sign_in_and_play
      visit '/play'
      expect(page).not_to have_content "It is Captain Potato's turn to attack'"
      expect(page).to have_content "It is Snuggly Marshmallow's turn to attack"
    end
    scenario 'switch which player is attacking' do
      sign_in_and_play
      visit '/play'
      click_button 'attack'
      click_button 'OK'
      expect(page).not_to have_content "It is Snuggly Marshmallow's turn to attack'"
      expect(page).to have_content "It is Captain Potato's turn to attack"
    end
  end

  feature 'HP goes down' do
    scenario 'when players switch, the hp goes down on player 1 as well' do
      sign_in_and_play
      visit '/play'
      click_button 'attack'
      click_button 'OK'
      click_button 'attack'
      click_button 'OK'
      expect(page).not_to have_content 'Snuggly Marshmallow has 60HP'
      expect(page).to have_content 'Snuggly Marshmallow has 50HP'
    end
  end


  feature 'Lose message' do
    scenario 'when a player reaches 0HP it shows a lose message' do
      sign_in_and_play
      10.times { attack_to_lose }
      click_button 'attack'
      expect(page).to have_content "Snuggly Marshmallow wins! You lose!"
    end
  end

end
