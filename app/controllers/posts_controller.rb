class PostsController < ApplicationController
  before_action :check_filter, :only => [:new, :create]

  def index
    @posts = Post.all
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

  protected

  def check_filter
    if current_user.nil?
      flash[:alert] = "You cannot do this without signing in."
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
