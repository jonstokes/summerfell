class Admin::InventoryItemsController < ApplicationController
  before_action :set_admin_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /admin/inventory_items
  # GET /admin/inventory_items.json
  def index
    @admin_inventory_items = Admin::InventoryItem.all
  end

  # GET /admin/inventory_items/1
  # GET /admin/inventory_items/1.json
  def show
  end

  # GET /admin/inventory_items/new
  def new
    @admin_inventory_item = Admin::InventoryItem.new
  end

  # GET /admin/inventory_items/1/edit
  def edit
  end

  # POST /admin/inventory_items
  # POST /admin/inventory_items.json
  def create
    @admin_inventory_item = Admin::InventoryItem.new(admin_inventory_item_params)

    respond_to do |format|
      if @admin_inventory_item.save
        format.html { redirect_to @admin_inventory_item, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @admin_inventory_item }
      else
        format.html { render :new }
        format.json { render json: @admin_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/inventory_items/1
  # PATCH/PUT /admin/inventory_items/1.json
  def update
    respond_to do |format|
      if @admin_inventory_item.update(admin_inventory_item_params)
        format.html { redirect_to @admin_inventory_item, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @admin_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/inventory_items/1
  # DELETE /admin/inventory_items/1.json
  def destroy
    @admin_inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to admin_inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_inventory_item
      @admin_inventory_item = Admin::InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_inventory_item_params
      params.fetch(:admin_inventory_item, {})
    end
end
