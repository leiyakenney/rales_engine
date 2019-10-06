require 'rails_helper'

describe 'Merchants Find All API' do
  it "returns all merchants by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/find_all?id=#{id}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"].count).to eq(1)

    expected = merchant["data"].all? { |hash| hash["attributes"]["id"] == id }
    expect(expected).to eq(true)
  end

  it "returns all merchants by name, case insensitive" do
    merchant_1 = Merchant.create(name: "Psych")
    merchant_2 = Merchant.create(name: "Psych")
    name_ci = merchant_1.name.downcase

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"
    merch = JSON.parse(response.body)

    expect(merch["data"].count).to eq(2)

    get "/api/v1/merchants/find_all?name=#{name_ci}"
    merch = JSON.parse(response.body)

    expect(merch["data"].count).to eq(2)
  end

  it "returns all merchants by created_at" do
    merchant_1 = create(:merchant, created_at: "2002-02-03T10:10:10.000Z")
    merchant_2 = create(:merchant, created_at: "2002-02-03T10:10:10.000Z")
    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"

    merch = JSON.parse(response.body)["data"]
    expect(merch.count).to eq(2)
  end

  it "returns all merchants by updated_at" do
    merchant_1 = create(:merchant, created_at: "2002-02-03T10:10:10.000Z",updated_at: "2002-02-03T11:11:11.000Z")
    merchant_2 = create(:merchant, created_at: "2002-02-03T10:10:10.000Z",updated_at: "2002-02-03T11:11:11.000Z")
    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

    merch = JSON.parse(response.body)["data"]
    expect(merch.count).to eq(2)
  end
end
