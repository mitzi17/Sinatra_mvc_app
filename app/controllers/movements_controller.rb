class MovementsController < ApplicationController

  # GET: /movements -> index
  get "/movements" do
    @movements = Movement.all
    erb :"/movements/index.html"
  end

  # GET: /movements/new -> new
  get "/movements/new" do
    redirect_if_not_logged_in
    @movement = Movement.new
    erb :"/movements/new.html"
  end

  # POST: /movements -> create
  post "/movements" do
    redirect_if_not_logged_in
    @movement = current_user.movements.build(date: params[:movement][:date],season: params[:movement][:season],category: params[:movement][:category],destination: params[:movement][:destination],box_number: params[:movement][:box_number],units_quantity: params[:movement][:units_quantity])
    if @movement.save
      flash[:success] = "Movement successfully created."
    redirect "/movements"
    else
    erb :"/movements/new.html"
    end
  end

  # GET: /movements/5 -> show
  get "/movements/:id" do
    get_movement
    erb :"/movements/show.html"  
  end

  # GET: /movements/5/edit -> edit
  get "/movements/:id/edit" do
    get_movement
    redirect_if_not_authorized
    erb :"/movements/edit.html" 
  end

  # PATCH: /movements/5 -> update
  patch "/movements/:id" do
    get_movement
    redirect_if_not_authorized
    if @movement.update(date: params[:movement][:date],season: params[:movement][:season],category: params[:movement][:category],destination: params[:movement][:destination],box_number: params[:movement][:box_number],units_quantity: params[:movement][:units_quantity])
      flash[:success] = "Movement successfully updated."
      redirect "/movements/#{@movement.id}" 
    else 
      erb :"/movements/edit.html"
    end
  end

  # DELETE: /movements/5/delete -> delete
  delete "/movements/:id" do
    get_movement
    redirect_if_not_authorized
    @movement.destroy
    flash[:success] = "Movement successfully deleted."
    redirect "/movements"
  end

  private

  def get_movement 
    @movement = Movement.find_by_id(params[:id])
    if @movement.nil?
      flash[:error] = "Couldn't find a movement with id: #{params[:id]}"
      redirect "/movements"
    end
  end

  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_movement(@movement) && !manager_user(current_user)
      flash[:error] = "Permission denied. You can only edit or delete your own movements."
      redirect "/movements"
    end
  end
  
  def authorize_movement(movement)
    current_user  == movement.user
  end

end
