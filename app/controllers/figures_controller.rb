class FiguresController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/figures/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures/new' do
    erb :new
  end

  post '/figures' do

  end

end
