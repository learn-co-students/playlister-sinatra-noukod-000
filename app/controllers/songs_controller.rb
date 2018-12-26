class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    # binding.pry
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug params[:slug]
    erb :"songs/show"
  end

  post '/songs' do
    # binding.pry
    song = Song.create params[:song]
    song.artist = Artist.find_or_create_by params[:artist]
    song.genres << Genre.create(params[:genre]) if !params[:genre][:name].empty?
    song.save

    flash[:message] = "Successfully created song."

    redirect("/songs/#{song.slug}")
  end

  get '/songs/:slug/edit' do
   @song = Song.find_by_slug params[:slug]
   erb :'songs/edit'
  end

  patch '/songs/:slug' do

    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    song.artist = Artist.find_or_create_by params[:artist]
    song.save

    flash[:message] = "Successfully updated song."

    redirect("/songs/#{song.slug}")
  end

end
