class Customer < ApplicationRecord
  has_many :invoices

  def self.favorite_customer(merchant_id)
    joins(invoices:[:merchant, :transactions]).
    select("customers.*, COUNT(*) AS cust").
    group(:id).
    where(invoices:{merchant_id: merchant_id}).
    merge(Transaction.successful).
    order("cust DESC").
    limit(1)
  end

end
