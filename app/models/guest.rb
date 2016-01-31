class Guest < ActiveRecord::Base
  belongs_to :package

  validates :package_id, presence: true
  validates :device_address, presence: true
  validates :access_point_address, presence: true

  validate :valid_device_address
  validate :valid_access_point_address

  def valid_device_address
    return true if !device_address.present? || device_address.valid_mac?(strict: true)
    errors.add(:device_address, "Invalid MAC format.")
  end

  def valid_access_point_address
    return true if !access_point_address.present? || access_point_address.valid_mac?(strict: true)
    errors.add(:access_point_address, "Invalid MAC format.")
  end
end
