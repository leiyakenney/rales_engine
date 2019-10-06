require 'rails_helper'

describe 'Merchants Find API' do
  it 'returns a merchant by its id' do
    id = create(:merchant).id

    get "/api/v1/merchants/find?id=#{id}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["id"].to_i).to eq(id)
  end

  it 'returns a merchant by its name not case sensitive' do
    name = create(:merchant).name
    name_case_ins = name.downcase

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant["data"]["attributes"]["name"]).to eq(name)

    get "/api/v1/merchants/find?name=#{name_case_ins}"

    merchant2 = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant2["data"]["attributes"]["name"]).to eq(name)
  end

  it 'returns a merchant by its created_at' do
    merchant = create(:merchant, created_at: "2002-02-03T10:10:10.000Z")
    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"
    expect(response).to be_successful
    merch = JSON.parse(response.body)["data"]
    expect(merch["id"].to_i).to eq(merchant.id)
  end

  it "returns a merchant by its updated_at" do
    merchant = create(:merchant, created_at: "1999-01-03T10:10:10.000Z",updated_at: "2002-02-03T11:11:11.000Z")
    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
    expect(response).to be_successful
    merch = JSON.parse(response.body)["data"]
    expect(merch["id"].to_i).to eq(merchant.id)
  end
end
