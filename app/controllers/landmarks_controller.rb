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

  patch '/landmarks/:id' do
    binding.pry
    if params[:landmark][:name].strip != ""
      @landmark = Landmark.update(:name => params[:landmark][:name])
    elsif params[:landmark][:year_completed].strip != ""
      @landmark = Landmark.update(:year_completed => params[:landmark][:year_completed])
    end
    @landmark.save
    redirect to "/landmarks/#{params[:id]}"
  end

end
