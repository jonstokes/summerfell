class TemporaryAuthorizeGuest
  include Troupe

  expects :device_address
  permits(:limit_up) { 3 * 1000 }
  permits(:limit_down) { 3 * 1000 }
  permits(:duration_minutes) { 3 }

  provides :unifi_controller do
    Unifi::Controller.new(host: Figaro.env.unifi_host)
  end

  provides :login_response, :authorize_guest_response, :logout_response

  def call
    self.login_response = unifi_controller.login
    self.authorize_guest_response = unifi_controller.authorize_guest(
      mac:     device_address,
      minutes: duration_minutes,
      down:    limit_down,
      up:      limit_up
    )
    context.fail!(error: 'authorization_failed') unless authorize_guest_response.status == 200
  ensure
    self.logout_response = unifi_controller.logout
  end
end