class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  enum status: %i[in_progress ordered canceled]
end
