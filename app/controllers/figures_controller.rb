class FiguresController < Sinatra::Base

  get '/figures/new' do
    erb ':/figures/new'
  end

end
