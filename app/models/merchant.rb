class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :name

  def self.most_revenue(quantity)
    joins(invoices:[:transactions, :invoice_items])
      .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .group(:id)
      .merge(Transaction.successful)
      .order("revenue DESC")
      .limit(quantity)
  end
end
