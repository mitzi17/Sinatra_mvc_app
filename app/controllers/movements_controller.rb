class MovementsController < ApplicationController

  # GET: /movements
  get "/movements" do
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
  get "/movements/:id" do
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
