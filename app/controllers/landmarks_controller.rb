class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{params[:id]}"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end

  patch '/landmarks' do
    if params[:landmark][:name].strip != "" && params[:landmark][:year_completed].strip != ""
      @landmark = Landmark.create(:name => params[:landmark][:name], :year_completed => params[:landmark][:year_completed])
    redirect to "/landmarks/#{params[:id]}"
  end

end
