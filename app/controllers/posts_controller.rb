class PostsController < ApplicationController
  before_action :check_filter, :only => [:new, :create]

  def index
    @imgboard = Imgboard.find(params[:imgboard_id])
    @posts = Post.where(:imgboard_id => params[:imgboard_id])
  end

  def show
    @imgboard = Imgboard.find(params[:imgboard_id])
    @post = Post.find(params[:id])
  end

  def new
    puts params.inspect
    @imgboard = Imgboard.find(params[:imgboard_id])
    @post = Post.new(:imgboard_id => params[:imgboard_id])
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
    params.require(:post).permit(:title, :body, :image, :imgboard_id)
  end
end
