require 'rails_helper'

RSpec.describe Api::V1::Merchants do
  describe "Merchant Business Intel" do
      before :each do
        @customer_1 = Customer.create(first_name: "Shawn", last_name: "Spencer")
        @customer_2 = Customer.create(first_name: "Burton", last_name: "Guster")
        @merchant_1 = Merchant.create(name: "Despareaux's Art")
        @merchant_2 = Merchant.create(name: "Yin Yang Twins Emporium")
        @item = @merchant_1.items.create(name: "Monet Knockoff", description: "So pretty", unit_price: 700000)
        @invoice = Invoice.create(merchant: @merchant_1, customer: @customer_1, status: 'shipped')
        @invoice_item = InvoiceItem.create(item: @item, invoice: @invoice, quantity: 2, unit_price: @item.unit_price)
        @transaction = Transaction.create(invoice: @invoice, credit_card_number: '123456789', result: 'success')
      end

      it "returns the top x merchants ranked by total revenue" do
        qty = 1
        get "/api/v1/merchants/most_revenue?quantity=#{qty}"

        data = JSON.parse(response.body)

        expect(data["data"].count).to eq(1)
        expect(data["data"].first["attributes"]["id"]).to eq(@merchant_1.id)
      end

      it "returns the total revenue for date x across all merchants" do
        get "/api/v1/merchants/revenue?date=#{Time.now}"
        expect(response).to be_successful
        revenue = JSON.parse(response.body)
        expect(revenue.class).to eq Hash
        expect(revenue['data'].count).to eq(1)
        expect(revenue["data"][0]["attributes"]["revenue"]).to be_a(Float)
      end

      it "returns the customer who has conducted the most total number of successful transactions" do
        get "/api/v1/merchants/#{@merchant_1.id}/favorite_customer"

        expect(response).to be_successful
        favorite_customer = JSON.parse(response.body)

        expect(favorite_customer["data"].count).to eq(1)
        expect(favorite_customer["data"][0]["attributes"]["first_name"]).to eq(@customer_1.first_name)
      end
    end
  end
