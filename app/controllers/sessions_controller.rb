class SessionsController < ApplicationController 

    get '/login' do 
        # this route renders the login form
        erb :'/sessions/login'
      end
    
      post '/login' do 
        # this route handles the form submission
        # first, finds the user by their username
        user = User.find_by_username(params[:username])
        # then if user exists and if password is correct log them in
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            redirect "/"
        #if not redirect them to the login page
        else
            @errors = "Incorrect username or password. Try again."
            erb :'/sessions/login'
        end
    end
end