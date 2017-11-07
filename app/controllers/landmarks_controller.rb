class LandmarksController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/landmarks/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/landmarks/new' do
    erb :new
  end

end
