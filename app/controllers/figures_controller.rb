class FiguresController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/figures/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures/new' do
    erb :new
  end

  post '/figures' do
    figure_1 = Figure.create(name: params[:figure[:name]])
    if params[:landmark_ids] != nil
      landmarks = []
      params[:landmark_ids].each do |landmark|
        landmarks << Landmark.find_by(name: landmark)
      end
      figure_1.update(landmarks: landmarks)
    end
    if params[:title_ids] != nil
      titles = []
      params[:title_ids].each do |title|
        titles << Title.find_by(name: title)
      end
      figure_1.update(titles: titles)
    end
    binding.pry
  end

end
