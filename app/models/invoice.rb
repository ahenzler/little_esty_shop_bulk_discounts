class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants

  enum status: [:cancelled, :in_progress, :complete]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def discount_revenue
    bulk_discounts.sum('(1.0 - (bulk_discounts.percentage_discount / 100.0)) * (invoice_items.unit_price * invoice_items.quantity)')
  end
end
