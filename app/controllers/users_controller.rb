class UsersController < ApplicationController

  get '/login' do #render login page/form
    erb :login
  end

  post '/login' do #gets the login form, find user and also log in 
      user = User.find_by(:name => params[:name]) #find by takes in key/value pair
    if user && user.authenticate(params[:password]) #verify if the user exitst with the right credentials
       session[:user_id] = user.id #key value pair/ logging in the user
      #redirect to '/techniques'
    else
      redirect to '/signup'
    end
  end

  get '/signup' do #render signup page/form
    if !logged_in?
      erb :'users/signup'
    else
    #   redirect to '/techniques'
  end

  post '/signup' do
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect to '/signup'
    end
  end



#   get '/users/:id' do
#     "show route"
#   end

 end
end