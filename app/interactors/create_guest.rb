class CreateGuest
  include Troupe

  expects :params

  provides :guest do
    Guest.create(guest_params)
  end

  def call
    context.fail!(error: guest.errors) unless guest.valid?
  end

  def guest_params
    params.slice(:package_id, :device_address, :access_point_address, :email)
  end
end