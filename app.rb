require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    'Testing infrastructure working!'
  end

  get '/battle' do
    @name1 = params[:name1]
    @name2 = params[:name2]
    erb(:index)
  end

  post '/names' do
    @name1 = params[:name1]
    @name2 = params[:name2]
    erb(:play)
  end
end
