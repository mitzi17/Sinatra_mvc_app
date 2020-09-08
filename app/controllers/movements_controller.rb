class MovementsController < ApplicationController

  # GET: /movements
  get "/movements" do
    #this route gets all the Movements and iterates over them in the movements/index.html view
    @movements = Movement.all
    erb :"/movements/index.html"
  end

  # GET: /movements/new -> new
  # this route assigns the instance to the @movement variable
  # then renders the form to create a movement
  get "/movements/new" do
    redirect_if_not_logged_in
    @movement = Movement.new
    erb :"/movements/new.html"
    
  end

  # POST: /movements -> create
  # this route creates a movement from the params hash from the form
  # if it saves then redirects to movements where index.html view is rendered
  # if its not saved, the form to create a movement is rendered
  post "/movements" do
    
    redirect_if_not_logged_in
    @movement = current_user.movements.build(date: params[:movement][:date],season: params[:movement][:season],category: params[:movement][:category],destination: params[:movement][:destination],box_number: params[:movement][:box_number],units_quantity: params[:movement][:units_quantity],user_id: params[:movement][:user_id])
    
    if @movement.save
    redirect "/movements"
    else
    erb :"/movements/new.html"
    end
  end

  # GET: /movements/5 -> show
  # this route finds a movement using the id from the params hash
  # then we can display the details in the show.html.erb view 
  get "/movements/:id" do
    set_movement
    erb :"/movements/show.html"
  end

  # GET: /movements/5/edit -> edit
  get "/movements/:id/edit" do
    set_movement
    redirect_if_not_authorized
    erb :"/movements/edit.html"
  end

  # PATCH: /movements/5 -> update
  patch "/movements/:id" do
    set_movement
    redirect_if_not_authorized
    if @movement.update(date: params[:movement][:date],season: params[:movement][:season],category: params[:movement][:category],destination: params[:movement][:destination],box_number: params[:movement][:box_number],units_quantity: params[:movement][:units_quantity],user_id: params[:movement][:user_id])
      flash[:success] = "Movement successfully updated"
      redirect "/movements/#{@movement.id}"
    else 
      erb :"/movements/edit.html"
    end
    
    
  end

  # DELETE: /movements/5/delete -> delete
  delete "/movements/:id" do
    set_movement
    redirect_if_not_authorized
    @movement.destroy
    redirect "/movements"
  end

  private

  def set_movement 
    @movement = Movement.find_by_id(params[:id])
    if @movement.nil?
      flash[:error] = "Couldn't find a Movement with id: #{params[:id]}"
      redirect "/movements"
    end
  end

  def redirect_if_not_authorized
    if !authorize_movement(@movement)
      flash[:error] = "You don't have permission to do that action"
      redirect "/movements"
    end
  end

  def authorize_movement(movement)
    current_user == movement.user
  end

end
