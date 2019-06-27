class TechniquesController < ApplicationController

  get '/techniques' do
    if logged_in?
        @techniques = current_user.techniques
        erb :'techniques/techniques'
    else
        redirect to '/login'
    end
  end

  post '/techniques' do
    if logged_in?
      if params[:content] == ""
        redirect to 'techniques/new'
      else
        @technique = Technique.create(content: params[:content], user_id: current_user.id)        
        redirect to "/techniques"
      end
    else
        redirect to '/login'
    end
   end

  get '/techniques/new' do
    if logged_in?
       erb :'techniques/new'
    else
       redirect to'/login'
    end
  end

   get '/techniques/:id' do    
    if logged_in?
        @technique = Technique.find(params[:id])
        erb :'techniques/show'
    else
        redirect to '/login'
    end
   end

   get '/techniques/:id/edit' do    
    if logged_in?
      @technique = Technique.find(params[:id])
      if @technique && @technique.user == current_user
        erb :'techniques/edit'
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
        @technique = Technique.find(params[:id])
        if @technique && @technique.user == current_user
          if @technique.update(content: params[:content])
            redirect to "/techniques"
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
      @technique = Technique.find(params[:id])
      if @technique && @technique.user == current_user
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