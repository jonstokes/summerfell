class Admin::BaseController < ApplicationController
  before_filter :authorize

  protected

  def authorize
    unless current_user.try(:admin?)
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end
end
