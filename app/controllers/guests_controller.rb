class GuestsController < ApplicationController
  # GET /guests/new
  def new
    @packages = FindPackagesForGuest.call(device_address: params[:guest_mac]).packages
    @guest = Guest.new
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:device_address, :package_id, :email, :access_point_address)
    end
end
