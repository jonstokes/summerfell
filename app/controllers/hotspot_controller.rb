class HotspotController < ApplicationController
  def index
    # From https://community.ubnt.com/t5/UniFi-Wireless/external-hotspot-portal/td-p/419845
    # http://hostname/guest/?id=20:aa:4b:95:bc:9d&ap=00:27:22:e4:ce:79&t=1363610350&url=http://facebook.com/&ssid=Test%20SSID

    # Check to see if the guest has already used a 2-hour trial before offering them that option.
    # Display the packages available
    
    @guest = {
      guest_mac: guest_params[:id]
      access_point_mac: guest_params[:ap]
      time: guest_params[:t]
      url: guest_params[:url]
    }
  end

  private

  def guest_params
    params.permit(:id, :ap, :t, :url)
  end
end
