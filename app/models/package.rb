class Package < ActiveRecord::Base
  scope :paid, -> { where("price_cents > 0").sort("price_cents DESC") }
  scope :free, -> { where("price_cents = 0") }

  validates :name, :description, :charged_as, presence: true
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :duration_minutes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :limit_up, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :limit_up
  validates :limit_down, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :limit_down
  validates :limit_quota, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :limit_quota
  validates :currency, inclusion: { in: %w(USD) }

  def free?
    price_cents == 0
  end
end
