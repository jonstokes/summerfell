class Admin::DeploymentsController < ApplicationController
  before_action :set_admin_deployment, only: [:show, :edit, :update, :destroy]

  # GET /admin/deployments
  # GET /admin/deployments.json
  def index
    @admin_deployments = Admin::Deployment.all
  end

  # GET /admin/deployments/1
  # GET /admin/deployments/1.json
  def show
  end

  # GET /admin/deployments/new
  def new
    @admin_deployment = Admin::Deployment.new
  end

  # GET /admin/deployments/1/edit
  def edit
  end

  # POST /admin/deployments
  # POST /admin/deployments.json
  def create
    @admin_deployment = Admin::Deployment.new(admin_deployment_params)

    respond_to do |format|
      if @admin_deployment.save
        format.html { redirect_to @admin_deployment, notice: 'Deployment was successfully created.' }
        format.json { render :show, status: :created, location: @admin_deployment }
      else
        format.html { render :new }
        format.json { render json: @admin_deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/deployments/1
  # PATCH/PUT /admin/deployments/1.json
  def update
    respond_to do |format|
      if @admin_deployment.update(admin_deployment_params)
        format.html { redirect_to @admin_deployment, notice: 'Deployment was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_deployment }
      else
        format.html { render :edit }
        format.json { render json: @admin_deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/deployments/1
  # DELETE /admin/deployments/1.json
  def destroy
    @admin_deployment.destroy
    respond_to do |format|
      format.html { redirect_to admin_deployments_url, notice: 'Deployment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_deployment
      @admin_deployment = Admin::Deployment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_deployment_params
      params.fetch(:admin_deployment, {})
    end
end
