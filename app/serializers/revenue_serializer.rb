class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :revenue do |rev|
    (rev.revenue/100).to_f
  end
end
