class Package < ActiveRecord::Base
  scope :paid, -> { where("price_cents > 0").sort("price_cents DESC") }
  scope :free, -> { where("price_cents = 0") }

  def free?
    price_cents == 0
  end
end
