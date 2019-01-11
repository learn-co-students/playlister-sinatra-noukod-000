class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    artist_name = params[:artist_name]
    artist_ids = params[:artist_ids]
    genre_ids = params[:genre_ids]

    if !artist_name.empty?
      @song.artist = Artist.find_or_create_by(name: artist_name)
    end

    # raise (params[:artist_ids]).inspect
    if artist_ids && !artist_ids.empty?
      @song.artist = Artist.find(artist_ids.first)
    end

    if genre_ids
      @song.genre_ids = genre_ids
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug params[:slug]
    @genres = Genre.all
    @artists = Artist.all

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    artist_name = params[:artist_name]
    artist_ids = params[:artist_ids]
    genre_ids = params[:genre_ids]
    
    @song = Song.find_by_slug params[:slug]

    @song.name ||= params[:name]

    if !artist_name.empty?
      @song.artist = Artist.find_or_create_by(name: artist_name)
    end

    if genre_ids
      @song.genre_ids = genre_ids
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end
  get '/songs/:slug' do
    @song = Song.find_by_slug params[:slug]
    erb :'songs/show'
  end


end
