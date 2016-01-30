class CreateGuest
  include Troupe

  expects :guest_params

  provides :guest do
    Guest.create(guest_params)
  end

  def call
    context.fail!(error: guest.errors) unless guest.valid?
  end
end