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

 helpers do
    
  def logged_in?
    !!current_user #truthines
  end
    
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #use find_by due to the fact it returns nil if user is false
    end
 end


end