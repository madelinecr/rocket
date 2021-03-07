class ApplicationController < ActionController::Base

  def index
    @imgboard_name = Rails.configuration.imgboard[:name]
  end
end
