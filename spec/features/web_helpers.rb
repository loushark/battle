def sign_in_and_play
  visit '/battle'
  fill_in 'name1', with: "Snuggly Marshmallow"
  fill_in 'name2', with: "Captain Potato"
  click_button 'Submit'
end

def attack_to_lose
  click_button 'attack'
  click_button 'OK'
end
