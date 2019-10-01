require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end

  it "can create a new customer" do
    customer_params = { first_name: "Leiya", last_name: "Kenney" }

    post "/api/v1/customers", params: {customer: customer_params}
    customer = Customer.last

    expect(response).to be_successful
    expect(customer.first_name).to eq(customer_params[:first_name])
    expect(customer.last_name).to eq(customer_params[:last_name])
  end

  it "can update an existing customer" do
    id = create(:customer).id
    previous_name = Customer.last.first_name
    customer_params = { first_name: "Evette", last_name: "Telyas" }

    put "/api/v1/customers/#{id}", params: {customer: customer_params}
    customer = Customer.find_by(id: id)

    expect(response).to be_successful
    expect(customer.first_name).to_not eq(previous_name)
    expect(customer.first_name).to eq("Evette")
  end

  it "can destroy an customer" do
    customer = create(:customer)

    expect{ delete "/api/v1/customers/#{customer.id}" }.to change(Customer, :count).by(-1)

    expect(response).to be_success
    expect{Customer.find(customer.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
