# require 'rails_helper'
#
# describe "Transactions API" do
#   it "sends a list of transactions" do
#     customer = create(:customer)
#     create(:transaction, customer: customer)
#     create(:transaction, customer: customer)
#     create(:transaction, customer: customer)
#
#     get '/api/v1/transactions'
#
#     expect(response).to be_successful
#
#     transactions = JSON.parse(response.body)
#
#     expect(transactions.count).to eq(3)
#   end
#
#   it "can get one transaction by its id" do
#     id = create(:transaction).id
#
#     get "/api/v1/transactions/#{id}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_successful
#     expect(transaction["id"]).to eq(id)
#   end
# end
