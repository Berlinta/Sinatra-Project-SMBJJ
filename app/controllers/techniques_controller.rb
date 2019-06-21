class TechniquesController < ApplicationController

  get '/techniques' do
    if logged_in?
        @user = Techniques.all
        erb :'techniques/techniques'
    else
        redirect '/'
    end
  end

  get '/techniques/new_techniques' do
    if logged_in?
       erb :'/techniques/new_techniques'
    else
       redirect '/'
    end
  end

  post '/techniques'
    if logged_in?
      if params[:content] = ""
        redirect to 'techniques/new_techniques'
      else
        @technique = current_user.techniques.create(content: params[:content])
        redirect to "/techniques/#{@technique.id}"
      end
    else
        redirect to '/login'
    end
   end

   get '/techniques/:id' do
    if logged_in?
        @technique = Techniques.find_by(params[:id])
        erb :'techniques/show_techniques'
    else
        redirect to '/login'
    end
   end
