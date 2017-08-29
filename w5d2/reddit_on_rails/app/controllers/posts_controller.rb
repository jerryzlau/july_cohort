class PostsController < ApplicationController
  def new
  end

  def create
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
