class HotspotRegistrationsController < ApplicationController
  before_action :set_hotspot_registration, only: [:show]

  # GET /hotspot_registrations/1
  # GET /hotspot_registrations/1.json
  def show
  end

  # GET /hotspot_registrations/new
  def new
    @hotspot_registration = HotspotRegistration.find_by_device_address(params[:id]) || HotspotRegistration.new

    respond_to do |format|
      if @hotspot_registration.authorized?
        format.html { render :thank_you }
      else
        format.html { render :new }
      end
    end
  end

  # POST /hotspot_registrations
  # POST /hotspot_registrations.json
  def create
    @hotspot_registration = HotspotRegistration.new(
      hotspot_registration_params.merge(
        email: stripe_params["stripeEmail"],
        card_token: stripe_params["stripeToken"]
      )
    )

    respond_to do |format|
      if @hotspot_registration.valid?
        @hotspot_registration.process_payment
        @hotspot_registration.save

        format.html { redirect_to @hotspot_registration, notice: 'Hotspot registration was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotspot_registration
      @hotspot_registration = HotspotRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotspot_registration_params
      params.permit(:id, :ap, :url, hotspot_registration: [:device_address, :access_point_address, :url, :email, :card_token])
    end
end
