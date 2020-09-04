class MovementsController < ApplicationController

  # GET: /movements
  get "/movements" do
    #this route gets all the Movements and iterates over them in the movements/index.html view
    @movements = Movement.all
    erb :"/movements/index.html"
  end

  # GET: /movements/new
  get "/movements/new" do
    erb :"/movements/new.html"
  end

  # POST: /movements
  post "/movements" do
    redirect "/movements"
  end

  # GET: /movements/5
  # this route finds a movement using the id from the params hash
  # then we can display the details in the show.html.erb view 
  get "/movements/:id" do
    @movement = Movement.find(params[:id])
    erb :"/movements/show.html"
  end

  # GET: /movements/5/edit
  get "/movements/:id/edit" do
    erb :"/movements/edit.html"
  end

  # PATCH: /movements/5
  patch "/movements/:id" do
    redirect "/movements/:id"
  end

  # DELETE: /movements/5/delete
  delete "/movements/:id/delete" do
    redirect "/movements"
  end
end
