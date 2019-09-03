require 'rails_helper'

RSpec.describe "Homes", type: :request do
  # describe "GET /homes" do
  #   it "works! (now write some real specs)" do
  #     get homes_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
  
  it "responds successfully" do
    get root_path
    
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end
  
end
