class FindPackagesForGuest
  include Troupe

  expects :device_address
  provides :packages

  def call
    # Check to see if the guest has already used a 2-hour trial before offering them that option.
    packages = if Guest.find_by(device_address: device_address, package_id: Package.free.pluck(:id))
      Package.paid
    else
      Package.all.sort("price_cents DESC")
    end
  end
end