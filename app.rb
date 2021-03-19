require 'sinatra/base'
require './lib/player'

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
    @player2_hp = $new_game.player2.hitpoints
    erb :play
  end

  post '/ok' do
    $new_game.attack($new_game.player2)
    redirect '/play'
  end

  post '/attack' do
    @name1 = $new_game.player1.name
    @name2 = $new_game.player2.name
    erb :attack
  end

  run! if app_file == $0
end
