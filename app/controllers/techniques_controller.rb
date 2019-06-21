class TechniquesController < ApplicationController

  get '/techniques' do
    if logged_in?
        @user = Techniques.all
        erb :'techniques/techniques'
    else
        redirect to '/login'
    end
  end

  post '/techniques' do
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

  get '/techniques/new_techniques' do
    if logged_in?
       erb :'techniques/new_techniques'
    else
       redirect to'/login'
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

   get '/techniques/:id/edit' do
    if logged_in?
      @technique = Techniques.find_by_id(params[:id])
      if @technique && @technique.user == current_user
        erb :'techniques/edit_techniques'
      else
        redirect to '/techniques'
      end
    else
      redirect to '/login'
    end
  end

    patch '/techniques/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "/techniques/#{params[:id]}/edit"
      else
        @technique = Techniques.find_by_id(params[:id])
        if @technique && @technique.user == current_user
          if @technique.update(content: params[:content])
            redirect to "/techniques/#{@technique.id}"
          else
            redirect to "/techniques/#{@technique.id/edit}"
          end
        else
          redirect to '/techniques'
        end
      end
    else
      redirect to '/login'
    end
  end

    delete '/techniques/:id' do
    if logged_in?
      @technique = Techniques.find_by_id(params[:id])
      if @technique && @technique.user == current_user
        #binding.pry
        @technique.delete
        redirect to '/techniques'
      else
        redirect to '/techniques'
      end
    else
      redirect to '/login'
    end
  end
end