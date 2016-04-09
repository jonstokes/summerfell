class PortalsController < ApplicationController

  def guest
    @device_address = guest_params[:id]
    @access_point_address = guest_params[:ap]
    @url = guest_params[:url]
  end

  def guest_params
    params.permit(:id, :ap, :url)
  end
end
