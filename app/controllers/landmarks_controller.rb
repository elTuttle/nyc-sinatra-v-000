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
    landmark = Landmark.find_by(id: params[:id])
    landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect to "/landmarks/#{landmark.id}"
  end

end
