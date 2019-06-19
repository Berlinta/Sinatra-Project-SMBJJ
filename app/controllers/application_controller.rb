require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' #sinatra starts here
    enable :sessions  #makes session available
    set :session_secret, "Xena" #creats session ID for protection
  end

  get "/" do
    erb :welcome
  end

end
