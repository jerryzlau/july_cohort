class TracksController < ApplicationController

  def new
    render :new
  end

  def index
    @tracks = Track.all
    render :index
  end

  # def create
  #
  # end
end
