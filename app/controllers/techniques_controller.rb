class TechniquesController < ApplicationController

  get '/techniques' do

    erb :'techniques/techniques'
  end

end