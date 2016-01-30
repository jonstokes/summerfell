class GuestsController < ApplicationController
  # GET /guests/new
  def new
    @packages = FindPackagesForGuest.call(device_address: params[:guest_mac]).packages
    @guest = Guest.new
  end

  # POST /guests
  # POST /guests.json
  def create
    create_guest = CreateGuest.call(
      guest_params: guest_params,
      transaction_information_params: transaction_information_params
    )
    @guest = create_guest.guest

    respond_to do |format|
      if create_guest.success?
        format.html { redirect_to params[:url] }
      else
        format.html { render :new }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:device_address, :package_id, :email, :access_point_address)
    end

    def transaction_information_params
      params.require(:transaction_information).permit(
        :cc_number,
        :security_code,
        :cc_expiry_month,
        :cc_expiry_year,
        :first_name,
        :last_name,
        :company_name,
        :address_line_1,
        :address_line_2,
        :city,
        :state,
        :zip,
        :country
      )
    end
end
