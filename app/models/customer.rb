class Customer < ApplicationRecord
  has_many :transactions
  has_many :invoices

  def fav_merchant

  end

end
