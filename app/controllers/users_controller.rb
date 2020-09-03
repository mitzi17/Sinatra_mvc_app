class UsersController < ApplicationController 

    get '/users/new' do 
      # this route will render the form to create a user accounts
      erb :'/users/new'
    end 
  
    post '/users' do 
        #this route will handle the form submission from new.erb
        @user = User.new(username: params[:username], password: params[:password])
        # take info from form (params) to create a new user and assign it to an instance variable
        if @user.save
            # if all goes well the user is saved and an session id will be assigned(cookie)
            #will redirect user to the welcome page
            session[:id] = @user.id
            redirect "homepage"
        else 
            #if user is not saved the sign up page will be rendered again
            erb :'users/new'
        end
    end

  end