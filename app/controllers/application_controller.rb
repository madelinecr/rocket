class ApplicationController < ActionController::Base
  #helper ApplicationHelper
  helper_method :site_name

  def index
    @imgboard = Imgboard.first
  end

  def site_name
    Rails.configuration.imgboard[:name]
  end
end
