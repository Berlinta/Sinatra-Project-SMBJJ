class UsersController < ApplicationController

  get '/login' do #render login page/form
    erb :login
  end

  post '/login' do #gets the login form, find user and also log in 
      user = User.find_by(:name => params[:name]) #find by takes in key/value pair
    if user && user.authenticate(params[:password]) #verify if the user exitst with the right credentials
    #binding.pry
      session[:user_id] = user.id #key value pair/ logging in the user
      redirect to '/techniques'
    else
      redirect to '/signup'
  end

  get '/signup' do

  end


  end
end