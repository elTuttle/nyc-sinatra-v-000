class FiguresController < Sinatra::Base

  get '/figures/new' do
    erb new
  end

end
