class Item < ApplicationRecord
  CATEGORIES = ["item", "electronics", "property", "food", "other"] #changed by AAG

  belongs_to :user
  has_one_attached :photo #added by AAG

  has_many :offered_trades, class_name: 'Trade', foreign_key: 'offered_item_id'
  has_many :requested_trades, class_name: 'Trade', foreign_key: 'requested_item_id'

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  # validates :photo, presence: true
  validates :category, presence: true

end
#, inclusion: { in: CATEGORIES }
