require 'rails_helper'

describe 'Merchant Relationship Endpoints' do
  it 'can return a collection of items associated with one merchant' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"
    expect(response).to be_successful

    merchant_items = JSON.parse(response.body)["data"]

    expect(merchant_items[0]["id"].to_i).to eq(item_1.id)
    expect(merchant_items[1]["id"].to_i).to eq(item_2.id)
  end

  it "can return a collection of invoices associated wtih the merchant from their orders" do
    merchant = create(:merchant)
    customer = create(:customer)
    item_1 = create(:invoice, merchant: merchant, customer: customer)
    item_2 = create(:invoice, merchant: merchant, customer: customer)

    get "/api/v1/merchants/#{merchant.id}/invoices"
    expect(response).to be_successful

    merchant_invoices = JSON.parse(response.body)["data"]

    expect(merchant_invoices[0]["id"].to_i).to eq(item_1.id)
    expect(merchant_invoices[1]["id"].to_i).to eq(item_2.id)
  end
end
