class HotspotRegistration < ActiveRecord::Base
  belongs_to :package

  validates :package_id, presence: true
  validates :device_address, presence: true
  validates :access_point_address, presence: true
  validates :terms, :inclusion => {:in => [true, false]}

  validate :valid_device_address
  validate :valid_access_point_address

  validate :valid_for_free_package, if: ->{ package_id == Package.free.id }

  def process_payment
    customer = Stripe::Customer.create(email: email, card: card_token)

    Stripe::Charge.create(
      customer:    customer.id,
      amount:      package.price_cents,
      description: package.name,
      currency:    'usd'
    )
  end

  def authorized?
    return false unless package
    Time.current >= expires_at
  end

  def expires_at
    self.created_at + (package.duration_minutes.minutes)
  end

  def can_use_free_package?
    return false unless device_address.present?
    return true unless previous_session = HotspotRegistration.find_previous_free_session(device_address)
    Time.current > (previous_session.expired_at + 24.hours)
  end

  def valid_for_free_package
    return if can_use_free_package?
    errors.add(:package_id, "You've already used the free package.")
  end

  def valid_device_address
    return true if !device_address.present? || device_address.valid_mac?(strict: true)
    errors.add(:device_address, "Invalid MAC format.")
  end

  def valid_access_point_address
    return true if !access_point_address.present? || access_point_address.valid_mac?(strict: true)
    errors.add(:access_point_address, "Invalid MAC format.")
  end

  def self.find_by_device_address(addr)
    HotspotRegistration.order("created_at DESC").find_by(device_address: addr)
  end

  def self.find_previous_free_session(addr)
    HotspotRegistration.order("created_at DESC").find_by(
      device_address: addr,
      package_id: Package.free.id
    )
  end
end
