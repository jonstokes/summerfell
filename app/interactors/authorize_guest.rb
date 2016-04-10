class AuthorizeGuest
  include Troupe

  expects :guest

  provides :unifi_controller do
    Unifi::Controller.new(host: Figaro.env.unifi_host)
  end

  provides :login_response, :authorize_guest_response, :logout_response

  def call
    self.login_response = unifi_controller.login
    self.authorize_guest_response = unifi_controller.authorize_guest(
      mac:     guest.device_address,
      minutes: guest.package.duration_minutes,
      down:    guest.package.limit_down,
      up:      guest.package.limit_up,
      quota:   guest.package.limit_quota
    )
    context.fail!(error: 'authorization_failed') unless authorize_guest_response.status == 200
  ensure
    self.logout_response = unifi_controller.logout
  end
end