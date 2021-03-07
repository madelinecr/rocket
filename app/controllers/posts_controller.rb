class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Successfully created a post!"
    else
      render action: "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
