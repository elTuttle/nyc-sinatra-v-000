class FiguresController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/figures/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures/new' do
    erb :new
  end

  post '/figures' do
    figure_1 = Figure.new(name: params[:figure[:name]])
    if params[:landmark_ids] != nil 
  end

end
