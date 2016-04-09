class API::V1::GuestsController < API::V1::BaseController

  # POST /guests.json
  def create
    create_guest = CreateHotspotGuest.call(
      params: guest_transaction_params,
    )
    @guest = create_guest.guest

    respond_to do |format|
      if create_guest.success?
        format.json { json: { status: :success } }
      else
        # TODO: Errors serializer
        format.json { json: { status: :failure, error: @guest.errors } }
      end
    end
  end

  def authorize
    respond_to do |format|
      if Guest.find_by(device_address: params[:id])
        format.json { json: { status: :success } }
      else
        # TODO: Errors serializer
        format.json { json: { status: :failure } }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_transaction_params
      params.permit(
        :device_address,
        :package_id,
        :email,
        :access_point_address
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
