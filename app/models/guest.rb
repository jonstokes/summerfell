class Guest < ActiveRecord::Base
  belongs_to :package
  belongs_to :transaction
  
  validates :package_id, presence: true
  validates :device_address, presence: true
  validates :access_point_address, presence: true

  validate :valid_device_address
  validate :valid_access_point_address

  validate :guest_can_use_free_package?, if: ->{ package_id == Figaro.env.free_package_id }

  def can_use_free_package?
    # TODO: Check to see if this guy has already used a free package
    true
  end

  def valid_device_address
    return true if !device_address.present? || device_address.valid_mac?(strict: true)
    errors.add(:device_address, "Invalid MAC format.")
  end

  def valid_access_point_address
    return true if !access_point_address.present? || access_point_address.valid_mac?(strict: true)
    errors.add(:access_point_address, "Invalid MAC format.")
  end
end
