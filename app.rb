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
    $player_1 = Player.new(params[:name1])
    $player_2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @name1 = $player_1.name
    @name2 = $player_2.name
    @player2_hp = $player_2.hitpoints
    erb :play
  end

  post '/ok' do
    $player_2.attack
    redirect '/play'
  end

  get '/attack' do
    @name1 = $player_1.name
    @name2 = $player_2.name
    erb :attack
  end

  run! if app_file == $0
end
