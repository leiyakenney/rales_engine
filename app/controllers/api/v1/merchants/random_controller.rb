class Api::V1::Merchants::RandomController < ApplicationController

  def show
    render json: MerchantSerializer.new(randomized(Merchant))
  end

end
