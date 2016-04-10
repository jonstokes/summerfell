class Admin::HotspotRegistrationsController < Admin::BaseController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /admin/guests
  # GET /admin/guests.json
  def index
    @hotspot_registrations = HotspotRegistration.all
  end

  # GET /admin/guests/1
  # GET /admin/guests/1.json
  def show
  end

  # GET /admin/guests/new
  def new
    @hotspot_registration = HotspotRegistration.new
  end

  # GET /admin/guests/1/edit
  def edit
  end

  # POST /admin/guests
  # POST /admin/guests.json
  def create
    @hotspot_registration = HotspotRegistration.new(guest_params)

    respond_to do |format|
      if @hotspot_registration.save
        format.html { redirect_to @hotspot_registration, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @hotspot_registration }
      else
        format.html { render :new }
        format.json { render json: @hotspot_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/guests/1
  # PATCH/PUT /admin/guests/1.json
  def update
    respond_to do |format|
      if @hotspot_registration.update(guest_params)
        format.html { redirect_to @hotspot_registration, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotspot_registration }
      else
        format.html { render :edit }
        format.json { render json: @hotspot_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/guests/1
  # DELETE /admin/guests/1.json
  def destroy
    @hotspot_registration.destroy
    respond_to do |format|
      format.html { redirect_to admin_guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @hotspot_registration = HotspotRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params[:admin_guest]
    end
end
