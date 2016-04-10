class Admin::HotspotRegistrationsController < Admin::BaseController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /admin/guests
  # GET /admin/guests.json
  def index
    @guests = HotspotRegistration.all
  end

  # GET /admin/guests/1
  # GET /admin/guests/1.json
  def show
  end

  # GET /admin/guests/new
  def new
    @guest = HotspotRegistration.new
  end

  # GET /admin/guests/1/edit
  def edit
  end

  # POST /admin/guests
  # POST /admin/guests.json
  def create
    @guest = HotspotRegistration.new(guest_params)

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

  # PATCH/PUT /admin/guests/1
  # PATCH/PUT /admin/guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/guests/1
  # DELETE /admin/guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to admin_guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = HotspotRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params[:admin_guest]
    end
end
