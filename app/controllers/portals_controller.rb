class PortalsController < ApplicationController
  before_filter :find_guest_by_device_address

  def guest
    # Example request:
    # GET /guest/s/default/?id=12:34:56:42:95:3a&ap=12:34:56:7a:6a:d0&t=1460220016&url=http://facebook.com/

    respond_to do |format|
      if @guest.try(:authorized?)
        format.html { render :thank_you }
      else
        format.html {
          redirect_to new_guest_path(
            device_address: guest_params[:id],
            access_point_address: guest_params[:ap],
            url: guest_params[:url]
          )
        }
      end
    end
  end

  private

  def guest_params
    params.permit(:id, :ap, :url)
  end

  def find_guest_by_device_address
    @guest = Guest.find_by_device_address(guest_params[:ap])
  end

  def redirect_url
    return Figaro.env.app_host unless guest_params[:url] && URI.parse(guest_params[:url]).host
    guest_params[:url]
  rescue URI::InvalidURIError
    Figaro.env.app_host
  end
end
