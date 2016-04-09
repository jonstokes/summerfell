class HotspotRegistrationsController < ApplicationController
  before_action :set_hotspot_registration, only: [:show, :edit, :update, :destroy]

  # GET /hotspot_registrations/1
  # GET /hotspot_registrations/1.json
  def show
  end

  # GET /hotspot_registrations/new
  def new
    @hotspot_registration = HotspotRegistration.new
  end

  # POST /hotspot_registrations
  # POST /hotspot_registrations.json
  def create
    @hotspot_registration = HotspotRegistration.new(hotspot_registration_params)

    respond_to do |format|
      if @hotspot_registration.save
        format.html { redirect_to @hotspot_registration, notice: 'Hotspot registration was successfully created.' }
        format.json { render :show, status: :created, location: @hotspot_registration }
      else
        format.html { render :new }
        format.json { render json: @hotspot_registration.errors, status: :unprocessable_entity }
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
      params.fetch(:hotspot_registration, {})
    end
end
