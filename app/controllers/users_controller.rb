class UsersController < ApplicationController 

    get '/users/new' do 
      # render the form to create a user account
      erb :'/users/new'
    end 
  
    post '/users' do 
  
    end
  end