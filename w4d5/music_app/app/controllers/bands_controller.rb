class BandsController < ApplicationController

  def index
    @band = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      render :index
    else
      flash.now[:errors] ||= []
      flash[:errors] << "Invalid band name"
      render :new
    end
  end



  private

  def band_params
    params.require(:band).permit(:name)
  end
end
