class PortalsController < ApplicationController

  def guest
    # Example request:
    # GET /guest/s/default/?id=12:34:56:42:95:3a&ap=12:34:56:7a:6a:d0&t=1460220016&url=http://facebook.com/
    @device_address = guest_params[:id]
    @access_point_address = guest_params[:ap]
    @url = guest_params[:url]
  end

  def guest_params
    params.permit(:id, :ap, :url)
  end
end
