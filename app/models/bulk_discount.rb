class BulkDiscount < ApplicationRecord
  validates_presence_of :percentage_discount,
                        :quantity_threshold

  belongs_to :merchant
  has_many :invoice_items, dependent: :nullify
end