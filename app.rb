require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    'Testing infrastructure working!'
  end

  get '/battle' do
    erb(:index)
  end

  post '/names' do
    $new_game = Game.new(params[:name1],params[:name2])
    redirect '/play'
  end

  get '/play' do
    @name1 = $new_game.player1.name
    @name2 = $new_game.player2.name
    @player1_hp = $new_game.player1.hitpoints
    @player2_hp = $new_game.player2.hitpoints
    @current_player_name = $new_game.current_player.name
    erb :play
  end

  post '/ok' do
    $new_game.attack($new_game.previous_player)
    redirect '/play'
  end

  post '/attack' do
    @current_player_name = $new_game.current_player.name
    @previous_player_name = $new_game.previous_player.name
    @win_or_lose = $new_game.hitpoints_zero?($new_game.previous_player)
    erb :attack
  end

  run! if app_file == $0
end
