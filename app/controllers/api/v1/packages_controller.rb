class API::V1::PackagesController < API::V1::BaseController
  # GET api/packages/available/:device_address
  def available
    packages = FindPackagesForGuest.call(device_address: params[:device_address]).packages

    respond_to do |format|
      format.json { render json: packages, each_serializer: API::PackageSerializer }
    end
  end
end