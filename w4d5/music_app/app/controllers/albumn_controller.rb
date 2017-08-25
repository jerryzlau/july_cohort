class AlbumnController < ApplicationController

  def index
    @album = Album.all
    render :index
  end

  def new
    render :new
  end

  def create
    band_name = album_params[:band_name]
    @band = Band.find_by(name: band_name)
    if @band
      @albumn = Album.new(title: album_params[:title],
                          year: album_params[:year],
                          band_id: @band.id)
      render :index
    else
      @band = Band.new(album_params[:band_name])
      @album = Album.new(title: album_params[:title],
                         year: album_params[:year],
                         band_id: @band.id)
      render :index
    end
  end

  def destroy
    @album = Album.find_by(album_params[:title])
    @album.delete 
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :band_name)
    #put in live column when ready
  end
end
