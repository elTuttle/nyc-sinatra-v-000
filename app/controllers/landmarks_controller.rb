class LandmarksController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/landmarks/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
  end

  get '/landmarks' do
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
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
    redirect to "/landmarks/#{landmark.id}"
  end

end
