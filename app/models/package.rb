class Package < ActiveRecord::Base
  scope :paid, -> { where.not(price_cents: nil).sort("price_cents DESC") }
  scope :free, -> { where(price_cents: nil) }
end
