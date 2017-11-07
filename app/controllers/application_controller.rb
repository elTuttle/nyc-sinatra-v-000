class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/figures") }
  register Sinatra::Twitter::Bootstrap::Assets
end
