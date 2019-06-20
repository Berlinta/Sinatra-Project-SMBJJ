class UsersController < ApplicationController

  get '/login' do #render login page/form
    if !logged_in?
      erb :'users/login'
    else
      redirect '/techniques'
    end
  end

  post '/login' do #gets the login form, find user and also log in 
      @user = User.find_by(:name => params[:name]) #find by takes in key/value pair
    if user && user.authenticate(params[:password]) #verify if the user exitst with the right credentials
       session[:user_id] = @user.id #key value pair/ logging in the user
      redirect to '/techniques'
    else
      redirect to '/signup'
    end
  end

  get '/signup' do #render signup page/form
    if !logged_in?
      erb :'users/signup'
    else
       redirect to '/techniques'
   end
  end

  post '/signup' do # creating a new user
    #binding.pry
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/techniques'
    end
  end

  get '/users/:id' do
    @user = User.find_by(params[:id])
    erb :'users/show'
  end

  get '/logout' do
    if logged_in?      
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

 end