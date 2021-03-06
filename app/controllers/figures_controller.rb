class FiguresController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/figures/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures' do
    erb :all_figures
  end

  get '/figures/new' do
    erb :new
  end

  post '/figures' do
    #binding.pry
    figure_1 = Figure.create(name: params[:figure][:name])
    if params[:figure][:landmark_ids] != nil
      landmarks = []
      params[:figure][:landmark_ids].each do |landmark|
        landmarks << Landmark.find_by(name: landmark)
      end
      figure_1.update(landmarks: landmarks)
    end
    if params[:figure][:title_ids] != nil
      titles = []
      params[:figure][:title_ids].each do |title|
        titles << Title.find_by(name: title)
      end
      figure_1.update(titles: titles)
    end
    if params[:landmark][:name] != nil
      landmark = Landmark.new(name: params[:landmark][:name])
      figure_1.landmarks << landmark
    end
    if params[:title][:name] != nil
      title = Title.new(name: params[:title][:name])
      figure_1.titles << title
    end
    figure_1.save
    redirect to "/figures/#{figure_1.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :edit_figure
  end

  patch '/figures/:id' do
    figure_1 = Figure.find_by(id: params[:id])
    figure_1.update(name: params[:figure][:name])
    if params[:figure][:landmark_ids] != nil
      landmarks = []
      params[:figure][:landmark_ids].each do |landmark|
        landmarks << Landmark.find_by(name: landmark)
      end
      figure_1.update(landmarks: landmarks)
    end
    if params[:figure][:title_ids] != nil
      titles = []
      params[:figure][:title_ids].each do |title|
        titles << Title.find_by(name: title)
      end
      figure_1.update(titles: titles)
    end
    if params[:landmark][:name] != nil
      landmark = Landmark.new(name: params[:landmark][:name])
      figure_1.landmarks << landmark
    end
    if params[:title][:name] != nil
      title = Title.new(name: params[:title][:name])
      figure_1.titles << title
    end
    figure_1.save
    redirect to "/figures/#{figure_1.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :show_figure
  end

end
