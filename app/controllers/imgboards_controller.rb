class ImgboardsController < ApplicationController

  def index
    @imgboards = Imgboard.all
  end

  def show
    @imgboard = Imgboard.find(params[:id])
  end

  def new
    @imgboard = Imgboard.new
  end

  def create
    @imgboard = Imgboard.new(board_params)

    if @imgboard.save
      flash[:notice] = "Image board created!"
      redirect_to imgboard_path(@imgboard)
    else
      render "new"
    end
  end

  private

  def board_params
    params.require(:imgboard).permit(:title)
  end
end
