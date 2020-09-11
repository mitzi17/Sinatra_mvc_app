class UsersController < ApplicationController 
    #this controller/routes handle resgistration
    get '/users/new' do 
      # this route will render the form to create a user accounts
      erb :'/users/new'
    end 
  
    post '/users' do 
        #this route will handle the form submission from new.erb
        @user = User.new(username: params[:username], password: params[:password])
        # take info from form (params) to create a new user and assign it to an instance variable
        
        if @user.save
            # if all goes well the user is saved(validations pass and there are no errors) and an session id will be assigned(cookie)
            #will redirect user to the welcome page
            session[:id] = @user.id
            redirect "/"
        else 
            #if user is not saved the sign up page will be rendered again
            erb :'users/new'
        end
    end

    get "/users/edit" do
        @users = User.all
        erb :'/users/edit'
    end

    delete "/users/:id" do
        user.destroy
        redirect "/users/edit"
      end




  end