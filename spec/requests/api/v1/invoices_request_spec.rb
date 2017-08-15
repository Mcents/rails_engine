require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
    create_list(:invoice, 3)

    get '/api/vi/invoices'

    expect(response).to be_success
  end
end
