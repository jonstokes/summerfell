class HotspotRegistrationsController < ApplicationController
  layout 'hotspot'
  before_action :set_hotspot_registration, only: [:show]

  # GET /hotspot_registrations/1
  # GET /hotspot_registrations/1.json
  def show
  end

  # GET /hotspot_registrations/new
  def new
    @hotspot_registration = HotspotRegistration.find_by_device_address(params[:id])

    Rails.logger.info "--- Checking MAC #{@hotspot_registration.device_address}"

    respond_to do |format|
      if @hotspot_registration.try(:authorized?)
        Rails.logger.info "--- MAC #{@hotspot_registration.device_address} is authorized!"
        format.all { redirect_to redirect_url }
      else
        Rails.logger.info "--- Registering MAC #{@hotspot_registration.device_address}..."

        @hotspot_registration = HotspotRegistration.new(
          device_address: hotspot_registration_params[:id],
          access_point_address: hotspot_registration_params[:ap]
        )

        Rails.logger.info "------ temporary auth of MAC #{@hotspot_registration.device_address}..."

        # Authorize guest for 5 mins so they can pay with Stripe.js
        TemporaryAuthorizeGuest.call(
          device_address: @hotspot_registration.device_address,
          duration_minutes: 5
        )

        Rails.logger.info "------ reg screen for MAC #{@hotspot_registration.device_address}"

        format.html { render :new }
      end
    end
  end

  # POST /hotspot_registrations
  # POST /hotspot_registrations.json
  def create
    @hotspot_registration = HotspotRegistration.new(hotspot_registration_params[:hotspot_registration])

    respond_to do |format|
      if @hotspot_registration.valid?
        @hotspot_registration.process_payment unless @hotspot_registration.package.free?
        @hotspot_registration.save
        AuthorizeGuest.call(guest: @hotspot_registration)
        format.html { redirect_to @hotspot_registration, notice: 'Hotspot registration was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def packages
    if @hotspot_registration.can_use_free_package?
      Package.order("price_cents ASC").to_a
    else
      Package.paid.order("price_cents ASC").to_a
    end
  end
  helper_method :packages

  private

  def redirect_url
    return Figaro.env.app_host unless params[:url] && URI.parse(params[:url]).host
    params[:url]
  rescue URI::InvalidURIError
    Figaro.env.app_host
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_hotspot_registration
      @hotspot_registration = HotspotRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotspot_registration_params
      params.permit(:id, :ap, :url, hotspot_registration: [:package_id, :device_address, :access_point_address, :url, :email, :card_token])
    end
end
