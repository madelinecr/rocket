class ApplicationController < ActionController::Base

  def index
    @imgboard = Imgboard.first
    @imgboard_name = Rails.configuration.imgboard[:name]
  end
end
