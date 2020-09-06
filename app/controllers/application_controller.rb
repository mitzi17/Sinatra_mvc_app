require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
    register Sinatra::Flash
  end

  get "/" do
    @movements = Movement.all
    erb :homepage
  end

  not_found do
    flash[:error] = "Whoops! Couldn't find that route"
    redirect "/movements"
  end

  private 

  def current_user 
    # this method returns the currently logged in user if there is one, and nil if there isn't
    # allows to add conditional logic in the view to display different options to logged in users
    User.find_by_id(session[:id])
  end

  def logged_in?
    # this method returns true or false
    !!current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view that page"
      redirect request.referrer || "/login"
    end
  end

end
