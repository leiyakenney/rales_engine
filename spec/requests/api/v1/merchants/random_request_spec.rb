require 'rails_helper'

describe 'Merchants Find API' do
  it 'returns a random merchant' do
    merchants = create_list(:merchant, 5)

    get "/api/v1/merchants/random"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"].count).to eq(1)
    expect(merchant["data"].first["type"]).to eq("merchant")
    expect(merchant["data"].first["attributes"].keys).to eq(["id", "name"])
  end
end
