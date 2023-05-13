class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  enum method_of_payment: { credit_card: 0, transfer: 1 }

  enum select_address: { my_address: 0, new_address: 1 }

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
