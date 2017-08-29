class SubsController < ApplicationController

  before_action :require_login
  before_action :require_moderator, only: [:edit, :update]

  def new

  end

  def create
    
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit

  end

  def update

  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)

  end
end
