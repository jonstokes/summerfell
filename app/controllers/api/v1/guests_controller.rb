class API::V1::GuestsController < API::V1::BaseController
  # POST /guests.json
  def create
    create_guest = CreateHotspotGuest.call(
      guest_params: guest_params,
      transaction_information_params: transaction_information_params
    )
    @guest = create_guest.guest

    respond_to do |format|
      if create_guest.success?
        format.json { json: { status: :success } }
      else
        format.json { json: { status: :failure, error: create_guest.error } }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:device_address, :package_id, :email, :access_point_address)
    end

    def transaction_information_params
      params[:transaction_information].permit(
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
